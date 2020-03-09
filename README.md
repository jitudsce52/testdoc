# Mkdocs
MkDocs is a fast, simple and downright gorgeous static site generator that's geared towards building project documentation

```bash
.
├── docker-entrypoint.sh
├── Dockerfile
├── Mkdocs_config
│   ├── docs
│   │   └── index.md
│   ├── index.html
│   ├── mkdocs.yml
│   └── site
│       ├── 404.html
│       ├── css
│       │   ├── base.css
│       │   ├── bootstrap.min.css
│       │   └── font-awesome.min.css
│       ├── fonts
│       │   ├── fontawesome-webfont.eot
│       │   ├── fontawesome-webfont.svg
│       │   ├── fontawesome-webfont.ttf
│       │   ├── fontawesome-webfont.woff
│       │   ├── fontawesome-webfont.woff2
│       │   ├── glyphicons-halflings-regular.eot
│       │   ├── glyphicons-halflings-regular.svg
│       │   ├── glyphicons-halflings-regular.ttf
│       │   ├── glyphicons-halflings-regular.woff
│       │   └── glyphicons-halflings-regular.woff2
│       ├── img
│       │   ├── favicon.ico
│       │   └── grid.png
│       ├── index.html
│       ├── js
│       │   ├── base.js
│       │   ├── bootstrap.min.js
│       │   └── jquery-1.10.2.min.js
│       ├── search
│       │   ├── lunr.js
│       │   ├── main.js
│       │   ├── search_index.json
│       │   └── worker.js
│       ├── sitemap.xml
│       └── sitemap.xml.gz
├── README.md
├── requirements.txt
└── setup.py
```
# Application Requirements:
 * python:3.8.1
 * mkdocs>=1.0
 * Pygments>=2.4
 * pymdown-extensions>=6.3
 * markdown>=3.2

* created a static website manually by using mkdocs locally.
Steps:
```bash
pip install mkdocs
jitud@DESKTOP-2916KDQ MINGW64 ~
$ mkdocs new project
INFO    -  Creating project directory: project
INFO    -  Writing config file: project\mkdocs.yml
INFO    -  Writing initial docs: project\docs\index.md

jitud@DESKTOP-2916KDQ MINGW64 ~/project
$ ls -l
total 1
drwxr-xr-x 1 jitud 197609  0 Feb 24 18:46 docs/
-rw-r--r-- 1 jitud 197609 20 Feb 24 18:46 docs/index.md
-rw-r--r-- 1 jitud 197609 20 Feb 24 18:46 mkdocs.yml

jitud@DESKTOP-2916KDQ MINGW64 ~/project
$ mkdocs build
INFO    -  Cleaning site directory
INFO    -  Building documentation to directory: C:\Users\jitud\project\site
INFO    -  Documentation built in 0.08 seconds

```
Use this above data to deploy mkdocs application with docker.

# copy repository
git clone https://github.com/jitudsce52/Mkdocs.git
cd Mkdocs

# Build Docker Image
----------------------
 sudo docker build . -t jitu/mkdocs
 
# Producing the website
----------------------
sudo docker run --rm -it -v ${PWD}/Mkdocs_config:/Mkdocs_config jitu/mkdocs produce

# Running the website
----------------------
 docker run --rm -d -p 8000:8000 -v ${PWD}/Mkdocs_config:/Mkdocs_config jitu/mkdocs serve


