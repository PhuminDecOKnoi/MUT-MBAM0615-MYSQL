const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('หากคุณต้องการหยุดโปรแกรม Node.js ที่กำลังรันอยู่บน MacBook ของคุณ สามารถทำได้ดังนี้: กด Control + C ในหน้าต่างเทอร์มินัลวิธีนี้เป็นวิธีที่ง่ายและรวดเร็วที่สุด ให้คุณกดปุ่มควบคุม (Control) และปุ่ม C พร้อมกันในหน้าต่างเทอร์มินัลที่กำลังรันโปรแกรม Node.js อยู่ โปรแกรมจะหยุดทำงานทันทีหยุดโปรเซสจาก Activity Monitorถ้าการกดปุ่มควบคุมไม่ได้ผล คุณสามารถหยุดโปรเซสของ Node.js ได้โดยใช้ Activity Monitor ทำตามขั้นตอนนี้:เปิด Activity Monitor (อยู่ในโฟลเดอร์ของ Utilities)ค้นหาโปรเซสของ Node.js (มักจะชื่อว่า "node" หรือ "node ชื่อไฟล์.js") คลิกที่โปรเซสนั้น แล้วคลิกปุ่ม "X" เพื่อหยุดโปรเซส')});

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});