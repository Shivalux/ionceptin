FROM	debian:buster

WORKDIR /app

COPY	./conf/prometheus.yml /etc/prometheus/prometheus.yml
COPY	./conf/prometheus.service /etc/systemd/system/prometheus.service

RUN		apt update && apt -y upgrade
RUN		apt install -y vim telnet curl
RUN		curl -LO https://github.com/prometheus/prometheus/releases/download/v2.22.0/prometheus-2.22.0.linux-arm64.tar.gz; \
		tar -xvf prometheus-2.22.0.linux-arm64.tar.gz; \
		mv prometheus-2.22.0.linux-arm64 prometheus-files; \
		useradd --no-create-home --shell /bin/false prometheus; \
		mkdir -p /etc/prometheus; \
		mkdir -p /var/lib/prometheus; \
		chown prometheus:prometheus /etc/prometheus; \
		chown prometheus:prometheus /var/lib/prometheus; \
		cp prometheus-files/prometheus /usr/local/bin/; \
		cp prometheus-files/promtool /usr/local/bin/; \
		chown prometheus:prometheus /usr/local/bin/prometheus; \
		chown prometheus:prometheus /usr/local/bin/promtool; \
		cp -r prometheus-files/consoles /etc/prometheus; \
		cp -r prometheus-files/console_libraries /etc/prometheus; \
		chown -R prometheus:prometheus /etc/prometheus/consoles; \
		chown -R prometheus:prometheus /etc/prometheus/console_libraries; \
		chown prometheus:prometheus /etc/prometheus/prometheus.yml;

EXPOSE	9090

ENTRYPOINT [ "prometheus", "--config.file=/etc/prometheus/prometheus.yml" ]
