local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Function to get the filename (without extension)
local function get_filename(_, snip)
    return snip.env.TM_FILENAME:gsub("%.java$", "")
end

ls.add_snippets("java", {
    s("bp", {
        t("public class "),
        f(get_filename), -- Get filename as class name
        t({" {", "    public static void main(String[] args) {", "        "}),
        i(1, "// Code here"), -- Cursor inside main method
        t({"", "    }", "}"}),
    }),

     s("arr", {
        t("int n = sc.nextInt();"),
        t({"", "int[] arr = new int[n];"}),
        t({"", "for (int i = 0; i < n; i++) {"}),
        t({"", "    arr[i] = sc.nextInt();"}),
        t({"", "}"}),
    }),

    -- Snippet for reading a 2D array
    s("arr2d", {
        t("int n = sc.nextInt(), m = sc.nextInt();"),
        t({"", "int[][] arr = new int[n][m];"}),
        t({"", "for (int i = 0; i < n; i++) {"}),
        t({"", "    for (int j = 0; j < m; j++) {"}),
        t({"", "        arr[i][j] = sc.nextInt();"}),
        t({"", "    }"}),
        t({"", "}"}),
    }),

    -- Snippet for reading a long array
    s("larr", {
        t("int n = sc.nextInt();"),
        t({"", "long[] arr = new long[n];"}),
        t({"", "for (int i = 0; i < n; i++) {"}),
        t({"", "    arr[i] = sc.nextLong();"}),
        t({"", "}"}),
    }),

    -- Snippet for reading a string array
    s("sarr", {
        t("int n = sc.nextInt();"),
        t({"", "String[] arr = new String[n];"}),
        t({"", "for (int i = 0; i < n; i++) {"}),
        t({"", "    arr[i] = sc.next();"}),
        t({"", "}"}),
    }),
    
    -- CodeForces Snippets
    s("cf", {
        t({
            "import java.io.*;",
            "",
            "public class "
        }),
        f(get_filename, {}), -- Insert class name dynamically
        t({
            " {",
            "",
            "    public static void main(String[] args) throws IOException {",
            "        FastInput sc = new FastInput();",
            "        int testcase = sc.nextInt();",
            "        while (testcase-- > 0) {",
            "            solve();",
            "        }",
            "    }",
            "",
            "    public static void solve() {",
            "        "
        }),
        i(1), -- Cursor inside solve function
        t({
            "",
            "    }",
            "",
            "    static class FastInput {",
            "        private final InputStream in = System.in;",
            "        private final byte[] buffer = new byte[1 << 16]; // 64 KB buffer",
            "        private int pointer = 0, bufferSize = 0;",
            "",
            "        private int read() {",
            "            if (pointer == bufferSize) {",
            "                try {",
            "                    bufferSize = in.read(buffer);",
            "                    if (bufferSize == -1) return -1; // EOF",
            "                    pointer = 0;",
            "                } catch (IOException e) {",
            "                    throw new RuntimeException(e);",
            "                }",
            "            }",
            "            return buffer[pointer++];",
            "        }",
            "",
            "        public int nextInt() {",
            "            int num = 0, sign = 1, c;",
            "            while ((c = read()) <= ' ') ; // Skip whitespace",
            "            if (c == '-') { sign = -1; c = read(); }",
            "            do {",
            "                num = num * 10 + (c - '0');",
            "            } while ((c = read()) >= '0' && c <= '9');",
            "            return num * sign;",
            "        }",
            "    }",
            "}"
        }),
    }),
    s("gcd", {
        i(1, "a"), t(" == 0 ? "), i(2, "b"), t(" : gcd("), i(3, "b"), t(", "), i(4, "a"), t(" % "), i(5, "b"), t(")")
    }),
    s("lcm", {
        i(1, "a"), t(" / gcd("), i(2, "a"), t(", "), i(3, "b"), t(") * "), i(4, "b")
    }),
    s("sortArray", {
        t("Arrays.sort("), i(1, "arr"), t(");")
    })
})
