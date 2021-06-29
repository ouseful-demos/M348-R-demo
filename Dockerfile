# TH: quick container for experimening with M348 environments

# Heavier than R notebook but rpy2 doesn't work in that container?
FROM jupyter/datascience-notebook

# Styling
COPY .jupyter/ /home/$NB_USER/.jupyter/
USER root
RUN fix-permissions /home/$NB_USER/.jupyter/
# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

# Install classic notebook extensions
RUN pip install --no-cache jupyter_contrib_nbextensions \
	nb-extension-tagstyler nb-extension-empinken nb-cell-execution-status \
	git+https://github.com/innovationOUtside/nb_cell_dialog.git \
	git+https://github.com/innovationOUtside/nb_cell_tools.git

# Install JupyterLab extensions
RUN pip install --no-cache sidecar

# Install additional R related items
#RUN pip install --no-cache rpy2
