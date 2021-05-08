FROM automad/automad:latest 

RUN rm -rf pages
RUN rm -rf shared 

COPY pages/post.txt pages/post.txt
COPY shared/data.txt shared/data.txt

RUN chown -R www-data:www-data /app
RUN chmod -R 755 /app