import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        String code = "install() {\n" +
                      "  echo \"Adding startup variables\"\n" +
                      "  local filename=\"$1\"\n" +
                      "  local url=\"https://cool-guys-bfc2.github.io/codport-shell/src/${filename}\"\n" +
                      "  echo \"Fetching script\"\n" +
                      "  # -s (silent) and -L (follow redirects) are good for scripts\n" +
                      "  curl -sL -o \"${filename}\" \"$url\"\n" +
                      "  echo \"Giving script execute permissions\"\n" +
                      "  chmod +x \"${filename}\"\n" +
                      "  echo \"Executing script\"\n" +
                      "  bash ${filename}\n" +
                      "  echo \"Job complete\"\n" +
                      "}\n" +
                      "install run.sh";

        try {
            ProcessBuilder builder = new ProcessBuilder("bash", "-c", code);
            builder.redirectErrorStream(true);
            Process process = builder.start();

            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }

            process.waitFor();
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
