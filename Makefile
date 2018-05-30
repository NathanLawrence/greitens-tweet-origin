.PHONY: workspace
workspace:
	pip install -r requirements.txt

.PHONY: ind_xls2csv
ind_xls2csv:
	for xlsfile in ./xls-individual-pull/*; do \
	fullname=$$(basename "$$xlsfile"); \
	extension="$${fullname##*.}"; \
	predot="$${fullname%.*}"; \
	rm -f "./csv-individual-pull/$$predot.csv"; \
	in2csv "$$xlsfile" > "./csv-individual-pull/$$predot.csv"; \
	done
