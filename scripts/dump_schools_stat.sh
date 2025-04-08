#!/usr/bin/env bash

NAME_DIR=school_base_stat
FILE_NAME=_basec
NAME_EXT=(
	"xls"
	"xlsx"
	"ods"
	"csv"
)

YEAR_START=87
YEAR_END=$(( $(date +%Y) - 1911 ))

WAIT_MIN=3
WAIT_MAX=5

check_file() {
	wget \
		--spider \
		"${1}" \
		>/dev/null \
		2>&1
}

download_file() {
	wget \
		-N \
		-P "./${NAME_DIR}" \
		--quiet \
		"${1}"
}

convert_ods_to_csv() {
	soffice \
		--convert-to csv \
		"${1}"
}

main() {
	for YEAR_CURRENT in $(seq ${YEAR_START} ${YEAR_END}); do
		echo "⚙️ Working on ${YEAR_CURRENT}"
		for FILE_EXT in "${NAME_EXT[@]}"; do
			URL_TARGET="https://stats.moe.gov.tw/files/detail/${YEAR_CURRENT}/${YEAR_CURRENT}${FILE_NAME}.${FILE_EXT}"
			echo "⚙️ Checking URL: ${URL_TARGET}" \
				&& check_file "${URL_TARGET}" \
				&& download_file "${URL_TARGET}" \
				&& echo "✅ File Downloaded: ${YEAR_CURRENT}${FILE_NAME}.${FILE_EXT}"
			sleep $((RANDOM % (WAIT_MAX - WAIT_MIN + 1) + WAIT_MIN))
		done

		# Convert ods to csv if missing
		if [ -f "./${NAME_DIR}/${YEAR_CURRENT}${FILE_NAME}.ods" ] \
			&& [ ! -f "./${NAME_DIR}/${YEAR_CURRENT}${FILE_NAME}.csv" ]; then
			echo "⚙️ Converting ods to csv for ./${NAME_DIR}/${YEAR_CURRENT}${FILE_NAME}.ods" \
				&& soffice \
					--convert-to csv \
					--outdir "./${NAME_DIR}" \
					"./${NAME_DIR}/${YEAR_CURRENT}${FILE_NAME}.ods" \
				&& echo "✅ File converted to ./${NAME_DIR}/${YEAR_CURRENT}${FILE_NAME}.csv" \
				&& echo "⚙️ Handling csv header..." \
				&& sed \
					-i '/,,,,,/d' \
					"./${NAME_DIR}/${YEAR_CURRENT}${FILE_NAME}.csv" \
				&& echo "✅ Non header Content removed"
		fi
	done
}

main
