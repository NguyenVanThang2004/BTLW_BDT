function loadReviewForm(productId) {
    $.get(`/api/review/CreateReview/${productId}`, function(response) {
        $('#reviewFormContainer').html(response);
        initializeStarRating();
    }).fail(function(error) {
        console.error('Error loading review form:', error);
        $('#reviewFormContainer').html('<div class="alert alert-danger">Có lỗi xảy ra khi tải form đánh giá</div>');
    });
}

function initializeStarRating() {
    $('.star-rating .fa').off().on({
        mouseenter: function() {
            var rate = $(this).data('rate');
            $(this).prevAll().addBack().removeClass('far').addClass('fas');
            $(this).nextAll().removeClass('fas').addClass('far');
        },
        mouseleave: function() {
            var selectedRate = parseInt($('#selectedRate').val()) || 0;
            $('.star-rating .fa').each(function(index) {
                $(this)[index < selectedRate ? 'removeClass' : 'addClass']('far')
                      [index < selectedRate ? 'addClass' : 'removeClass']('fas');
            });
        },
        click: function() {
            var rate = $(this).data('rate');
            $('#selectedRate').val(rate);
            $(this).prevAll().addBack().removeClass('far').addClass('fas');
            $(this).nextAll().removeClass('fas').addClass('far');
        }
    });
}

function loadReviews(productId) {
    $.ajax({
        url: `/api/review/productreview/${productId}`,
        method: 'GET',
        success: function(data) {
            var reviewsContainer = $('#reviewsContainer');
            reviewsContainer.empty();

            if (data.reviews && data.reviews.length > 0) {
                renderReviews(data, reviewsContainer);
            } else {
                reviewsContainer.html('<p>Chưa có đánh giá nào cho sản phẩm này.</p>');
            }
        }
    });
}

function renderReviews(data, container) {
    var reviewHtml = `<h4 class="mb-4">${data.reviews.length} đánh giá cho "${data.dmSp.tenSanPham}"</h4>`;
    data.reviews.forEach(function(review) {
        reviewHtml += createReviewHtml(review);
    });
    container.html(reviewHtml);
    attachReviewEventHandlers();
}

function createReviewHtml(review) {
    var isCurrentUser = currentUsername === review.tenDangNhap;
    var actionButtons = isCurrentUser ? createActionButtons(review.maSanPham) : '';
    
    return `
        <div class="media mb-4">
            <img src="/images/user-avatar.png" alt="Avatar" class="img-fluid mr-3 mt-1" style="width: 45px;">
            <div class="media-body">
                <h6>${review.tenDangNhap}<small> - <i>${new Date(review.thoiGianDanhGia).toLocaleDateString()}</i></small></h6>
                <div class="text-primary mb-2">
                    ${createStarRating(review.rate)}
                </div>
                <p>${review.noiDung}</p>
                ${actionButtons}
            </div>
        </div>
    `;
}

function createStarRating(rate) {
    return [...Array(5)].map((_, i) => 
        `<i class="${i < rate ? 'fas' : 'far'} fa-star"></i>`
    ).join('');
}

function createActionButtons(productId) {
    return `
        <div class="mt-2">
            <button class="btn btn-sm btn-primary edit-review" data-product-id="${productId}">
                <i class="fas fa-edit"></i> Sửa
            </button>
            <button class="btn btn-sm btn-danger delete-review" data-product-id="${productId}">
                <i class="fas fa-trash"></i> Xóa
            </button>
        </div>
    `;
}

function attachReviewEventHandlers() {
    $('.edit-review').click(function() {
        loadReviewForm($(this).data('product-id'));
    });

    $('.delete-review').click(function() {
        deleteReview($(this).data('product-id'));
    });
}

function handleReviewSubmit(formData, isUpdate) {
    $.ajax({
        url: `/api/review/${isUpdate ? 'updatereview' : 'submitreview'}`,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(formData),
        success: function(response) {
            if (response.success) {
                loadReviews(formData.maSanPham);
                loadReviewForm(formData.maSanPham);
            } else {
                alert(response.message);
            }
        }
    });
}

function deleteReview(productId) {
    if (confirm('Bạn có chắc muốn xóa đánh giá này?')) {
        $.ajax({
            url: `/api/review/deletereview/${productId}`,
            type: 'POST',
            success: function(response) {
                if (response.success) {
                    loadReviews(productId);
                    loadReviewForm(productId);
                } else {
                    alert(response.message);
                }
            }
        });
    }
} 