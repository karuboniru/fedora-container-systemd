from registry.fedoraproject.org/fedora:rawhide

MAINTAINER <yanqiyu@fedoraproject.org>

RUN 	dnf update -y \
	&& dnf install systemd passwd -y \
	&& dnf clean all \
	&& passwd -d root \
	&& ln /dev/null -s /etc/systemd/system/systemd-journald-audit.socket \
	&& ln /dev/null -s /etc/systemd/system/sys-kernel-tracing.mount \
	&& ln /dev/null -s /etc/systemd/system/sys-kernel-debug.mount \
	&& ln /dev/null -s /etc/systemd/system/sys-kernel-config.mount \
	&& ln /dev/null -s /etc/systemd/system/proc-sys-fs-binfmt_misc.automount \
	&& rm -rf /tmp/*
ENTRYPOINT ["/usr/lib/systemd/systemd", "--system", "--system-unit=basic.target"]

