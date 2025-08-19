FROM busybox:latest
CMD [ "ping", "-c", "3", "google.com" ]
