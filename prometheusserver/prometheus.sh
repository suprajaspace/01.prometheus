sudo su -
cd /opt/
wget https://github.com/prometheus/prometheus/releases/download/v3.2.1/prometheus-3.2.1.linux-amd64.tar.gz
sleep 10
ls -l
tar -xf prometheus-3.2.1.linux-amd64.tar.gz
mv prometheus-3.2.1.linux-amd64 prometheus
cd prometheus
scp prometheus.yml /prometheus.yml
cat prometheus.yml
# vim /etc/systemd/system/prometheus.service
sleep 5
cd /etc/systemd/system/
scp prometheus1.txt /prometheus.service
cat prometheus.service
systemctl start prometheus
systemctl status prometheus
   
netstat -lntp