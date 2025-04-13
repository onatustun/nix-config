{
  programs.oh-my-posh = {
    enable = true;

    settings = {
      transient_prompt = {
        foreground_templates = [
	        "{{if gt .Code 0}}red{{end}}"
	        "{{if eq .Code 0}}green{{end}}"
	      ];

	      background = "transparent";
	      template = "❯ ";
      };

      secondary_prompt = {
        foreground = "green";
	      background = "transparent";
	      template = "❯❯ ";
      };

      blocks = [
        {
          type = "prompt";
	        alignment = "left";
	        newLine = true;

	        segments = [
            {
              type = "path";
	            style = "plain";
	            background = "transparent";
              foreground = "yellow";
	            properties.style = "full";
	            template = "{{ .Path }}";
            }

            {
              type = "git";
	            style = "plain";
	            foreground = "#6c6c6c";
	            background = "transparent";
	            template = " {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} <cyan>{{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}</>";

	            properties = {
	              branch_icon = "";
	              fetch_status = true;
		            commit-icon = "@";
              };
            }
          ];
        }

	      {
	        type = "prompt";
	        alignment = "left";
	        newLine = true;

	        segments = [
	          {
	            type = "text";
	            style = "plain";

	            foreground_templates = [
	              "{{if gt .Code 0}}red{{end}}"
		            "{{if eq .Code 0}}green{{end}}"
	            ];

	            background = "transparent";
	            template = "❯ ";
	          }
	        ];
	      }

	      {
	        type = "rprompt";
          overflow = "hidden";

	        segments = [
	          {
	            type = "executiontime";
	            style = "plain";
	            foreground = "red";
	            background = "transparent";
	            template = "{{ div .Ms 1000 }}s";
	            properties.threshold = 5000;
            }
          ];
        }
      ];
    };
  };
}
