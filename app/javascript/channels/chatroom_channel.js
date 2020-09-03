import consumer from "./consumer";
const initChatroom = () => {
  const messagesContainer = document.getElementById('messages');
 
  if (messagesContainer) {
    const input = document.getElementById('message_content');
    const userId = messagesContainer.dataset.userId;


    window.scrollTo(0,document.body.scrollHeight);
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        const lastMessage = document.querySelectorAll(".message-container:last-child")[0]
        const messageUser = lastMessage.dataset.userId;
        lastMessage.classList.remove("speech-bubbly");
        lastMessage.classList.remove("speech-bubble");
        if(userId === messageUser){
          lastMessage.classList.add("speech-bubbly");
        }
        else {
          lastMessage.classList.add("speech-bubble");
        }
        input.value = '';
        window.scrollTo(0,document.body.scrollHeight);
      },
    });
  }
}
export { initChatroom };
