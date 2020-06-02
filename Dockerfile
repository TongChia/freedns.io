FROM alpine
COPY update.sh update.sh
CMD ["sh", "update.sh"]