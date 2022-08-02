FROM vinhio/php8:latest

VOLUME /home/www/app
EXPOSE 80 443

# Copy configuration files
ADD local /

# Replace default nginx user and group with IDs, matching current host user (developer)
ARG hostUID=1000
ARG hostGID=1000
ENV hostUID=$hostUID
ENV hostGID=$hostGID
RUN echo "uid:gid=$hostUID:$hostGID" &&\
    oldUID=`id -u nginx` &&\
    deluser nginx &&\
    addgroup -g $hostGID nginx &&\
    adduser -S -u $hostUID -G nginx -h /home/www -s /sbin/nologin nginx &&\
    find /var -user $oldUID -exec chown -v $hostUID:$hostGID {} \;

#### Add more supporting stuff
# Declaration
ENV NPM_HOME_ROOT=/root/.npm
ENV NPM_HOME=/home/www/.npm
ENV CONFIG_HOME=/home/www/.config
ENV COMPOSER_HOME=/home/www/.composer
# Create file/dir
RUN mkdir $NPM_HOME_ROOT
RUN mkdir $NPM_HOME
RUN mkdir $CONFIG_HOME
RUN mkdir $COMPOSER_HOME
# Change owner
RUN chown -v $hostUID:$hostGID $NPM_HOME_ROOT
RUN chown -v $hostUID:$hostGID $NPM_HOME
RUN chown -R $hostUID:$hostGID $CONFIG_HOME
RUN chown -R $hostUID:$hostGID $COMPOSER_HOME
