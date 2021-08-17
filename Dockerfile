FROM amazon/aws-cli
RUN yum install -y python3
WORKDIR /root
COPY ./ /root
RUN chmod +x aws-assume-role
ENTRYPOINT ["./aws-assume-role"]

