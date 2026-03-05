#!/bin/bash

# Stop script if an error occurs
set -e

echo "=============================="
echo "Installing Nginx"
echo "=============================="

sudo apt update
sudo apt install nginx -y

echo "=============================="
echo "Starting and Enabling Nginx"
echo "=============================="

sudo systemctl start nginx
sudo systemctl enable nginx

echo "=============================="
echo "Deploying Web Page"
echo "=============================="

sudo tee /var/www/html/index.html > /dev/null <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My World of DevOps!</title>

<style>
body{
    margin: 0;
    height: 100vh;
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(#7f7fd5,#86a8e7,#91eae4);
    text-align:center;
    padding-top:120px;
}

.container{
    background:rgba(255,255,255,0.85);
    padding:40px;
    width:60%;
    margin:auto;
    border-radius:30px;
    box-shadow:0px 0px 40px rgba(90,90,158,0.7);
    z-index: 2;
}

/* Heading and second paragraph */
.title{
    font-family: 'Courier Prime', monospace;
    color:#2E3A6D;
    font-size:48px;
    margin: 0,
    text-shadow: 0 0 15px white, 0 0 25px #5D6DA8;}   

/* First paragraph */
.first-paragraph{
    font-family: 'Comic Sans MS', cursive, sans-serif;
    color:#8688e7;
    font-size:22px;
}
.flakes {
        position: absolute; width: 6px; height: 6px;
        background: white; border-radius: 30%;
        animation: twinkle 2s infinite ease-in-out;
      }
      @keyframes twinkle { 0%,100% { opacity:0; transform:scale(0.5); } 50% { opacity:1; transform:scale(1.5); } 
      }

.cloud {
        position:absolute; background:#fff; border-radius:50px; opacity:0.7;
        animation: moveClouds 60s linear infinite;
      }
      @keyframes moveClouds { from { transform:translateX(-200px); } to { transform:translateX(110vw); } 
      }

button{
    padding:12px 25px;
    font-family: 'Courier Prime', monospace;
    font-size:16px;
    border:none;
    background:#91EAE4;
    color:#6a6767;
    border-radius:30px;
    cursor:pointer;
}

button:hover{
    background:#86a8e7;
}
</style>

</head>

<body>

<div class="container">
<h1 class="title">Welcome to My World of DevOps!</h1>

<p class="first-paragraph">
Where Sleep is temporary and Uptime is forever.
</p>

<button onclick="alert('Your server is running successfully!')">
Let's Begin
</button>
</div>

</body>
</html>
EOF

echo "=============================="
echo "Restarting Nginx"
echo "=============================="

sudo systemctl restart nginx

echo "=============================="
echo "Nginx Status"
echo "=============================="

sudo systemctl status nginx --no-pager

echo "Deployment Complete!"
