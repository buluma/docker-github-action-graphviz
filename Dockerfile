FROM buluma/fedora:33

LABEL maintainer="Michael Buluma <me@buluma.co.ke>"
LABEL build_date="2022-06-25"

WORKDIR /github/workspace

ADD make_dot.sh /make_dot.sh
ADD make_png.sh /make_png.sh

RUN dnf install -y graphviz \
    python3-pip && \
    dnf clean all

RUN pip install shyaml

CMD cd ${GITHUB_REPOSITORY} && sh /make_dot.sh && sh /make_png.sh
