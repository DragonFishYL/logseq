master： ubuntu@34.223.42.68
web：ubuntu@35.88.43.188
证书：peas-village.pem

db.adminCommand({renameCollection: "chat.chat_data", to: "chat.chat_data_02"})

