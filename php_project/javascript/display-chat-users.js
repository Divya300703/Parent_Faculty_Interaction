const chatLink = document.querySelector("#chat");
const chatUsers = document.querySelector(".available__user");
const searchBar = document.querySelector(".search");

const refreshChatUsers = async () => {
  try {
    const response = await fetch("php/chat-users.php", {
      method: "POST",
    });

    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }

    const data = await response.text();
    chatUsers.innerHTML = data;
  } catch (error) {
    console.error("Error fetching chat users:", error);
  }
};

window.onload = (e) => {
  e.preventDefault();
  refreshChatUsers();
};

searchBar.onkeyup = async (e) => {
  e.preventDefault();
  const searchValue = e.target.value.trim();

  if (searchValue) {
    try {
      const response = await fetch("php/search-chat-users.php", {
        method: "POST",
        headers: {
          "Content-type": "application/x-www-form-urlencoded",
        },
        body: "searchValue=" + searchValue,
      });

      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }

      const data = await response.text();
      chatUsers.innerHTML = data;
    } catch (error) {
      console.error("Error searching chat users:", error);
    }
  }
};
