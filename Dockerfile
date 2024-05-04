# Use the official Nginx image from Docker Hub
FROM nginx:latest

# Label the maintainer (optional)
LABEL maintainer="shaksha.shalu@gmail.com"

# Remove the default server definition
RUN rm /etc/nginx/conf.d/default.conf

# (Optional) Add your custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the static contents of your site to the new Nginx web directory
COPY ./var/lib/jenkins/workspace/pipeline-1/ /var/www/html

# Expose port 80 to the outside once the container has launched
EXPOSE 80

# Start Nginx when the container has launch
CMD ["nginx", "-g", "daemon off;"]
