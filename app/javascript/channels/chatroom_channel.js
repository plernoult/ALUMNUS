import consumer from "./consumer";

const initChatroom = () => {
  const messagesContainer = document.getElementById('messages');
  const input = document.getElementById('message_content');
  if (messagesContainer) {
    window.scrollTo(0,document.body.scrollHeight);
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        input.value = '';
        window.scrollTo(0,document.body.scrollHeight);
      },
    });
  }
}

export { initChatroom };
