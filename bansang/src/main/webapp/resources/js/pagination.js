function makePage(param) {
	var ptag = param.tag
			|| "<li data-page=$$page><span class='paginate_button previous disabled' id='example1_previous'>Prev</span></li>";
	var ntag = param.tag
			|| "<li data-page=$$page><span class='paginate_button next' id='example1_next'>Next</span></li>";
	var tag = param.tag
			|| "<li data-page=$$page><a href='#' aria-controls='example1' class='paginate_button active'>$$pageStr</a></li>";

	var pageSize = param.pageSize || 10;
	var liCount = param.liCount || 10;
	var total = param.total || 0;
	var current = param.current || 1;
	var tempEnd = makeTempEnd();
	var startNum = makeStart();
	var realEnd = makeRealEnd();
	var prev = startNum - 1;
	var next = tempEnd * pageSize < total ? tempEnd + 1 : 0;

	function makeTags() {
		var str = "";

		if (prev != 0) {
			str += ptag.replace("disabled", "").replace("$$page", prev);
		} else {
			str += ptag.replace("$$page", "none");
		}
		for (var i = startNum; i <= realEnd; i++) {
			if (current === i) {
				str += tag.replace("$$page", i).replace("$$pageStr", i);
			} else {
				str += tag.replace("$$page", i).replace("$$pageStr", i)
						.replace("active", "");
			}

		}
		if (next != 0) {
			str += ntag.replace("disabled", "").replace("$$page", next);
		} else {
			str += ntag.replace("$$page", "none");
		}

		return str;
	}

	// tempEnd
	function makeTempEnd() {
		return Math.ceil(current / liCount) * liCount;
	}

	// start
	function makeStart() {
		return tempEnd - (liCount - 1);
	}

	// realEnd
	function makeRealEnd() {
		var lastPage = Math.ceil(total / pageSize);
		return tempEnd > lastPage ? lastPage : tempEnd;
	}

	return makeTags();
}
