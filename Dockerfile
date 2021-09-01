FROM node:10.1
WORKDIR /usr/src/app
# This is not ideal
COPY . . 
# every time you run the copy & run, it's a new layer, so best practice to combine run commands with &&
RUN npm install 
RUN npm run build
# Docker uses different ports because on their virtual machine, so this is telling them to expose and map it to our 3000 port, 3000 is node convention
# This itself doesn't do anything -- just to let other developers know which port to expose to
EXPOSE 3000
# when future someone makes our image and starts the container, if this is done as RUN, then when developer starts it can't run it because it's already running
# syntax is [ "executable", "param 1", "..." ]
ENTRYPOINT ["npm", "start"]
