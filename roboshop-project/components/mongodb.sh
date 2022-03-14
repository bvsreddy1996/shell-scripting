source components/common.sh

echo "Download Mongodb repo file"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG_FILE

echo "Install MongoDB"
yum install -y mongodb-org &>>$LOG_FILE

echo "Update MongoDB Config file"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>$LOG_FILE

echo "Start Database"
systemctl enable mongod &>>$LOG_FILE
systemctl start mongod &>>$LOG_FILE