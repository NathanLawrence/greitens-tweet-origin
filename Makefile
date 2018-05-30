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
	in2csv "$$xlsfile" -e utf-8-sig > "./csv-individual-pull/$$predot.csv"; \
	done

.PHONY: merge_pulls
merge_pulls:
	time=$$(date '+%Y-%m-%d-%H_%M_%S'); \
	filename="merge-$$time.csv"; \
	files=$$(find "$$PWD/csv-individual-pull" -type f); \
	csvstack -e utf-8-sig $$files > "pulls_merged/$$filename"; \
	python dedupe.py "pulls_merged/$$filename"
