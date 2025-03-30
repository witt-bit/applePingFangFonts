update:
	@[ -d "tmp/PingFang-for-Windows" ] || git clone https://github.com/ACT-02/PingFang-for-Windows.git tmp/PingFang-for-Windows
	@[ -d "tmp/PingFang-Relaxed" ] || git clone https://github.com/ACT-02/PingFang-Relaxed.git tmp/PingFang-Relaxed
	@cd tmp/PingFang-for-Windows && git pull && \
		find . -name "*.otf" -type f -print0 | while read -r -d '' otf_file; do \
			fileName=$$(basename "$$otf_file"); \
			o_dirname=$${fileName%-*}; \
			dirname=$${o_dirname,}; \
			cp "$${otf_file}" "../../pingFang/$${dirname}/"; \
		done

	@cd tmp/PingFang-Relaxed && git pull && \
		find . -name "*.otf" -type f -print0 | while read -r -d '' otf_file; do \
			fileName=$$(basename "$$otf_file"); \
			o_dirname=$${fileName%-*}; \
			dirname=$${o_dirname,}; \
			cp "$${otf_file}" "../../pingFangRelaxed/$${dirname}/"; \
    	done


package:
	$(MAKE) clean
	@mkdir -p target/;
	@any_font_path=$$(find pingFang/ -type f -print0 | shuf -z -n 1 | tr -d '\0'); \
		version=$$(otfinfo -i "$$any_font_path" | awk '/Version:.*/ { print $$2 }'); \
		echo "package::pingFang $$version"; \
		tar -czf "target/pingFang-$$version.tar.gz" pingFang/;

	@any_font_path=$$(find pingFangRelaxed/ -type f -print0 | shuf -z -n 1 | tr -d '\0'); \
		version=$$(otfinfo -i "$$any_font_path" | awk '/Version:.*/ { print $$2 }'); \
		echo "package::pingFangRelaxed $$version"; \
		tar -czf "target/pingFangRelaxed-$$version.tar.gz" pingFangRelaxed/;

	@any_font_path=$$(find pingFangUI/ -type f -print0 | shuf -z -n 1 | tr -d '\0'); \
		version=$$(otfinfo -i "$$any_font_path" | awk '/Version:.*/ { print $$2 }'); \
		echo "package::pingFangUI $$version"; \
		tar -czf "target/pingFangUI-$$version.tar.gz" pingFangUI/;

# This will remove the files downloaded and created in the build process
clean:
	@rm -rf target/;

# publish:
# 	@current_version=$(shell sed -n 's/^pkgver=\(.*\)$$/\1/p' PKGBUILD)
# 	@git add .
# 	@echo commit -m "Update to version $$current_version"
# 	@echo "commit $$current_version"
#	git push
