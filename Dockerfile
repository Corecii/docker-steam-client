FROM thewtex/opengl

# Download and install steam + base dependencies:
RUN wget -O ~/steam.deb https://steamcdn-a.akamaihd.net/client/installer/steam.deb && \
	sudo dpkg -i ~/steam.deb; \
	sudo apt-get update && \
	sudo apt-get install -fyqq && \
	sudo dpkg -i ~/steam.deb

# Make steam deps installer not require user interaction:
RUN sudo sed -i '/^read line$/d' /usr/bin/steamdeps

COPY etc /etc

# Run steam once to install initial version
COPY install-steam-once.sh /home/user/install-steam-once.sh
# We have to run supervisord to run xdummy so steam can start with graphics
RUN /usr/bin/supervisord -c /etc/supervisor/install-steam.conf & \
	sleep 4 && \
	su - user -c "sh /home/user/install-steam-once.sh" && \
	exit
