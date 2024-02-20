# My LaTeX CV Repository

This repository contains the LaTeX code for my CV.

## Compiling LaTeX Code

### With Docker Container

1. **Prerequisites**:
   - Install Docker on your system.

2. **Building and Running Docker Container**:
   - Ensure Docker is installed and running on your system.
   - Open a terminal or command prompt.
   - Build the Docker image using the provided Dockerfile:
     ```bash
     docker build . --file .devcontainer/Dockerfile --tag latex-compiler
     ```
   - Run the Docker container to compile the LaTeX code (Linux):
     ```bash
     docker run --rm \
       --volume $(pwd):/latex \
       latex-compiler /bin/bash -c \
       "cd /latex && make clean && make"
     ```
   - Run the Docker container to compile the LaTeX code (Windows):
     ```bash
      docker run --rm `
        --volume ${PWD}:/latex `
        latex-compiler /bin/bash -c `
        "cd /latex && make clean && make"
     ```

When you first run Docker with the provided configuration, it may take more time as the Docker engine builds the container based on the Dockerfile in the `.devcontainer` directory. Subsequent runs should be faster as Docker caches the built container.

### Without Docker Container

1. **Prerequisites**:
   - Install LaTeX distribution (e.g., TeX Live or MiKTeX) on your system. You can install TeX Live on Ubuntu using the following command:
     ```bash
     sudo apt-get -y install \
        texlive-latex-base \
        texlive-latex-extra \
        texlive-extra-utils \
        texlive-fonts-extra \
        texlive-fonts-recommended \
        texlive-xetex \
        texlive-pstricks \
        biber chktex latexmk make python3-pygments python3-pkg-resources
     ```

2. **Compilation**:
   - Open a terminal or command prompt.
   - Navigate to the directory containing the LaTeX files.
   - Run the following command to compile the LaTeX code using `xelatex`:
     ```bash
     xelatex -output-directory=build main.tex
     ```
   - On Linux, you can use the provided script:
     ```bash
     make
     ```

## Using LaTeX Workshop extension

The Docker configuration provided in this repository is compatible with the LaTeX Workshop extension for Visual Studio Code. To use the Docker configuration effectively, ensure you have the following extensions installed in Visual Studio Code:

1. **Docker Extension**: Install the Docker extension for VS Code to manage Docker containers and images directly from the editor.

2. **Remote - Containers Extension**: Install the Remote - Containers extension for VS Code to enable development in containers. This extension allows you to seamlessly develop inside Docker containers, providing a consistent environment across different machines.

With these extensions installed, you can use the Docker configuration provided in this repository with the LaTeX Workshop extension for editing and compiling LaTeX documents directly within VS Code.

To set up the Docker configuration with the LaTeX Workshop extension:
1. Install the Docker extension and the Remote-Containers extension in Visual Studio Code.
2. Open your LaTeX project in VS Code.
3. Ensure Docker is installed and running on your system.
4. Execute `Remote-Containers: Reopen in Container` in the VS Code Command Palette.

When you first run Docker with the provided configuration, it may take more time as the Docker engine builds the container based on the Dockerfile in the `.devcontainer` directory. Subsequent runs should be faster as Docker caches the built container.

## GitHub Actions

This repository is configured to use GitHub Actions for automated LaTeX compilation whenever a new tag is created. The workflow includes the following steps:
1. Check out the code from the repository.
2. Build Docker image for LaTeX compilation.
3. Compile LaTeX code using the Docker container.
4. Create a release with the generated PDF as an asset.

The PDF file corresponding to each tagged release can be found in the [releases](../../releases) section.

## PDF

The compiled PDF file for the latest release can be found in the [releases](../../releases) section.

## References

1. <https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex>
2. <https://www.overleaf.com/articles/sonu-kumars-cv/zbfzwzctwptn>
3. <https://github.com/James-Yu/LaTeX-Workshop/wiki/Install#using-docker>
4. <https://code.visualstudio.com/docs/devcontainers/create-dev-container>
5. <https://code.visualstudio.com/docs/containers/overview>
