const hamburgerButton = document.querySelector('.hamburger');
const messagingApp = document.querySelector('.messagingApp');
const appOverlay = document.querySelector('.appOverlay');
const sendButton = document.querySelector('.sendButton');
const textBox = document.querySelector('.textbox');
const messageContainer = document.querySelector('.messages');
const messageWrapper = document.querySelector('.messageWrapper');
const defaultText = 'Type a message...';

hamburgerButton.addEventListener('click', () => {
  messagingApp.classList.add('messagingApp--navOpen');
});
appOverlay.addEventListener('click', () => {
  messagingApp.classList.remove('messagingApp--navOpen');
});
/**
* Message payload
* {me: boolean, message: string}
*/
const messages = [];

let me = true;

/**
* Renders messages
*/
const renderMessages = () => {
  messageContainer.innerHTML = '';
  
  if (messages.length === 0) {
    appendInfo('Start your chat.');
    return;
  }
  
  messages.forEach((message, index) => {
    if (index > 0 && index % 4 === 0) {
      appendInfo('Some day.');
    }
    appendMessage(message.message, message.me);
  });
}

/**
* Sets the vertical scroll of an element to maximum.
*/
const scrollToBottom = (element) => {
  element.scrollTop = element.scrollHeight;
}

/**
* Adds info to the chat
*/
const appendInfo = (message) => {
  if (!message) {
    return;
  }
  
  const info = document.createElement('div');
  info.classList.add('info');
  info.textContent = message;
  
   messageContainer.appendChild(info);
}


/**
* Adds a message to the chat box
*/
const appendMessage = (message, messageIsMine) => {
  if (!message) {
    return;
  }
  
  const chat = document.createElement('div');
  chat.classList.add('chat');
  
  if (messageIsMine) {
    chat.classList.add('me');
  }
  
  chat.innerHTML = message;
  messageContainer.appendChild(chat);
  
  scrollToBottom(messageWrapper);
}

/**
* Handles (fake) sending of a message
*/
const sendMessage = (event) => {
  if (event.type === 'keypress' && event.keyCode !== 13) {
    return;
  }
  
  if (event.type === 'keypress' && event.keyCode === 13  && event.shiftKey) {
    return;
  }
  
  event.preventDefault();
  
  const message = textBox.innerHTML.trim();
  
  if(message === defaultText || message === '') {
    return;
  }
  
  messages.push({message, me});
  renderMessages();
  
  if (event.type === 'click') {
    textBox.textContent = defaultText;
  } else {
    textBox.textContent = '';
  }
  
  me = !me;
}

textBox.addEventListener('focus', () => {
  if(textBox.textContent.trim() === defaultText) {
    textBox.textContent = '';
  }
});

textBox.addEventListener('blur', () => {
  if(textBox.textContent.trim() === '') {
    textBox.textContent = defaultText;
  }
});

sendButton.addEventListener('click', sendMessage);
textBox.addEventListener('keypress', sendMessage);
// set the vertical scroll to maximum
scrollToBottom(messageWrapper);
renderMessages();