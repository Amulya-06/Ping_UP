# HappyPing Setup Guide

This guide will help you set up and run HappyPing locally on your machine.

## Prerequisites

Before you begin, make sure you have the following installed:

1. **Node.js** (v14 or higher) - [Download here](https://nodejs.org/)
2. **npm** (comes with Node.js)
3. **MongoDB** - [Download here](https://www.mongodb.com/try/download/community)

## Project Structure

This application consists of three main components:

1. **Client** - React frontend (runs on port 5173)
2. **Server** - Express backend API (runs on port 5000)
3. **Socket** - Socket.io server for real-time messaging (runs on port 3000)

## Setup Steps

### 1. Install Dependencies

Dependencies have already been installed for all three components. If you need to reinstall:

```bash
# Install server dependencies
cd server
npm install

# Install socket dependencies
cd ../socket
npm install

# Install client dependencies
cd ../client
npm install
```

### 2. MongoDB Setup

The application uses MongoDB for data storage. The `.env` file in the `server` folder is configured to use a local MongoDB instance:

```
ATLAS_URI=mongodb://127.0.0.1:27017/chatapp
```

**To start MongoDB:**

- **Windows**: If MongoDB is installed as a service, it should start automatically. Otherwise, run:
  ```bash
  mongod
  ```

- **macOS/Linux**: 
  ```bash
  # Using Homebrew (macOS)
  brew services start mongodb-community

  # Or manually
  mongod --dbpath /path/to/your/data/directory
  ```

**Verify MongoDB is running:**
- Open a new terminal and run: `mongosh` or `mongo`
- You should see the MongoDB shell prompt

### 3. Environment Variables

The environment files are already configured:

**Server** (`server/.env`):
```
PORT=5000
ATLAS_URI=mongodb://127.0.0.1:27017/chatapp
JWT_SECRET_KEY=supersceret79938884
```

**Client** (`client/.env`):
```
VITE_API_URL=http://localhost:5000
VITE_SOCKET_URL=http://localhost:3000
```

## Running the Application

You need to run all three components simultaneously. Open **three separate terminal windows**:

### Terminal 1 - Start the Server (Backend API)
```bash
cd server
npm start
```

You should see:
```
Listening on port... : 5000
MongoDB connection established
```

### Terminal 2 - Start the Socket Server
```bash
cd socket
npm start
```

You should see:
```
New Connection [socket-id]
```

### Terminal 3 - Start the Client (Frontend)
```bash
cd client
npm run dev
```

You should see:
```
VITE v5.x.x  ready in xxx ms

➜  Local:   http://localhost:5173/
```

## Accessing the Application

Once all three servers are running, open your browser and navigate to:

**http://localhost:5173**

## Troubleshooting

### MongoDB Connection Issues

If you see "MongoDB connection failed":
1. Make sure MongoDB is installed and running
2. Check if MongoDB is listening on port 27017
3. Verify the connection string in `server/.env`

### Port Already in Use

If you get a "port already in use" error:
- **Port 5000**: Change `PORT` in `server/.env`
- **Port 3000**: Modify the port in `socket/index.js` (line 36)
- **Port 5173**: Vite will automatically try the next available port

### CORS Issues

If you encounter CORS errors, make sure:
- The server is running on port 5000
- The socket server is running on port 3000
- The client URLs in `client/.env` match the actual ports

## Features

- User registration and authentication
- Private messaging between users
- Real-time message delivery via Socket.io
- Message notifications
- Chat history

## Next Steps

1. Register a new account
2. Log in
3. Start chatting with other registered users!

Enjoy HappyPing! 🚀
