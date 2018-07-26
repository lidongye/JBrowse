############################################################
# Dockerfile to build JBrowse
# Based on node
# Including：
############################################################

FROM node

# File Author / Maintainer
MAINTAINER 李东野<dongye_bio@qq.com>

# Copy Config
COPY Config/MyConfig.pm /root/.cpan/CPAN/

# Set npm taobao registry
RUN npm config set registry http://registry.npm.taobao.org/

# Set node_path
ENV NODE_PATH="/usr/local/lib/node_modules/"

# Install node env
RUN npm install -g node-getopt \
	&& npm install -g fs-extra \
	&& npm install -g express \
	&& npm install -g shelljs

# Copy programe
COPY JBrowse.tar.gz /JBrowse/

RUN tar zxvf /JBrowse/JBrowse.tar.gz -C /JBrowse \
	&& rm /JBrowse/JBrowse.tar.gz \
	&& cd /JBrowse/JBrowse/ \
    && bash setup.sh

# Set port
EXPOSE 3000 8001

# Set workdir
WORKDIR /JBrowse/JBrowse/

# Run server command
CMD ["/usr/local/bin/node", "utils/jb_run.js" ,"-p", "3000"]

