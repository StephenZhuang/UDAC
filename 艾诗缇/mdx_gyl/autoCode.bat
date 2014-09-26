rd /s/q andoridConfig
rd /s/q androidapis
rd /s/q androidjson
rd /s/q cproto
rd /s/q iosApi
rd /s/q iosConfig
rd /s/q iosConfigJson
rd /s/q iosJson
rd /s/q iosProto

if not exist src md src 
if not exist cproto md cproto 
if not exist iosProto md iosProto

cd proto
"../lib/protoc" --java_out=../src  *.proto
"../lib/protoc" --java_out=../cproto  *.proto

cd ../lib
java -jar autoCodeApi.jar ../
pause


