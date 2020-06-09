pip-compile --generate-hashes --upgrade --no-annotate --no-header --allow-unsafe  --output-file requirements/main.txt  requirements/main.in
pip-compile --generate-hashes --upgrade --no-annotate --no-header --allow-unsafe  --output-file requirements/tests.txt  requirements/tests.in
pip-compile --generate-hashes --upgrade --no-annotate --no-header --allow-unsafe  --output-file requirements/dev.txt  requirements/dev.in
pip-compile --generate-hashes --upgrade --no-annotate --no-header --allow-unsafe  --output-file requirements/deploy.txt  requirements/deploy.in
