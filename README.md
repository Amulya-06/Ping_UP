# PingUP💬

PingUP is a **full-stack real-time private chat application** that allows secure messaging between logged-in users. It uses modern web technologies and Socket.io to provide instant messaging and live notifications.

---

## 🚀 Tech Stack

- **Frontend:** React (Vite), React Router, React Bootstrap  
- **Backend:** Node.js, Express.js  
- **Database:** MongoDB  
- **Real-time Communication:** Socket.io  
- **Authentication & Security:** JWT, Bcrypt, Validator  
- **Other Libraries:** cors, dotenv, moment, react-input-emoji

---

## ✨ Features

- User registration & login authentication  
- Private one-to-one real-time chat  
- Instant message notifications  
- Secure password hashing  
- Live messaging using WebSockets

---

## 📂 Project Structure

- **Client** – React frontend UI  
- **Server** – APIs, authentication & database logic  
- **Socket** – Real-time messaging using Socket.io

---

## ⚙️ Run Locally

```bash
# Start backend
cd server
npm start

# Start socket server
cd socket
npm start

# Start frontend
cd client
npm run dev
