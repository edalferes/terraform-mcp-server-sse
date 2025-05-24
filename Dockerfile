
FROM supercorp/supergateway:2.8.3

ARG TERRAFORM_MCP_SERVER_VERSION=0.1.0
ARG WORKDIR=/opt/supergateway
ENV PORT=8000
ENV LOG_LEVEL=info
ENV SSE_PATH=/sse
ENV MESSAGE_PATH=/message

WORKDIR ${WORKDIR}

RUN apk add --no-cache curl unzip

RUN curl -Lo terraform.zip \
    https://releases.hashicorp.com/terraform-mcp-server/${TERRAFORM_MCP_SERVER_VERSION}/terraform-mcp-server_${TERRAFORM_MCP_SERVER_VERSION}_linux_amd64.zip \
 && unzip terraform.zip \
 && rm terraform.zip LICENSE.txt \
 && chmod +x terraform-mcp-server

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE ${PORT}

ENTRYPOINT ["entrypoint.sh"]