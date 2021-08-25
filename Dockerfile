#FROM debian:buster
FROM balenalib/rpi-raspbian

RUN apt-get update && apt-get install -y wget tar && apt-get clean
RUN wget -P /tmp https://raw.githubusercontent.com/bizarrelabs/motion/master/install-motion.sh
RUN wget -P / https://raw.githubusercontent.com/bizarrelabs/motion/master/entrypoint.sh
RUN chmod 755 /./entrypoint.sh
RUN chmod 755 /tmp/./install-motion.sh
RUN /tmp/./install-motion.sh

CMD /./entrypoint.sh

EXPOSE 80
