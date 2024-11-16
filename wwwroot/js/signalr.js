// Khởi tạo kết nối SignalR
let connection; // Khai báo ở phạm vi global

// Hàm khởi tạo kết nối
function initializeConnection() {
    if (!connection) { // Kiểm tra nếu connection chưa được khởi tạo
        connection = new signalR.HubConnectionBuilder()
            .withUrl("/chatHub")
            .configureLogging(signalR.LogLevel.Information)
            .build();
    }
    return connection;
}

// Khởi tạo kết nối
connection = initializeConnection();

// Bắt đầu kết nối
async function startConnection() {
    try {
        await connection.start();
        console.log("SignalR Connected.");
    } catch (err) {
        console.log(err);
        setTimeout(startConnection, 5000);
    }
}

// Xử lý sự kiện nhận tin nhắn
connection.on("ReceiveMessage", function (user, message) {
    const msg = message.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    const encodedMsg = user + " says " + msg;
    const li = document.createElement("li");
    li.textContent = encodedMsg;
    document.getElementById("messagesList").appendChild(li);
});

// Hàm gửi tin nhắn
async function sendMessage(user, message) {
    try {
        await connection.invoke("SendMessage", user, message);
    } catch (err) {
        console.error(err);
    }
}

// Xử lý khi kết nối bị ngắt
connection.onclose(async () => {
    console.log("SignalR Disconnected.");
    await startConnection();
});

// Khởi động kết nối khi trang web được tải
startConnection();

// Xử lý form submit (ví dụ)
document.getElementById("sendButton").addEventListener("click", function (event) {
    event.preventDefault();
    const user = document.getElementById("userInput").value;
    const message = document.getElementById("messageInput").value;
    sendMessage(user, message);
    document.getElementById("messageInput").value = "";
}); 