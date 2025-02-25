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

    -- CodeForces BoilerPlate
    s("cf", {
        t({"import java.io.*;", "import java.util.*;", "", "public class "}),
        f(get_filename), -- Get filename as class name
        t({" {", "", "    static class FastReader {",
            "        private final byte[] buffer = new byte[1 << 16];",
            "        private int index, total;",
            "        private InputStream in;",
            "",
            "        public FastReader() { in = System.in; }",
            "",
            "        private int read() throws IOException {",
            "            if (index == total) {",
            "                index = 0; total = in.read(buffer);",
            "                if (total == -1) return -1;",
            "            }",
            "            return buffer[index++];",
            "        }",
            "",
            "        public int nextInt() throws IOException {",
            "            int number = 0, sign = 1, c = read();",
            "            while (c <= ' ') c = read();",
            "            if (c == '-') { sign = -1; c = read(); }",
            "            while (c >= '0' && c <= '9') {",
            "                number = number * 10 + (c - '0');",
            "                c = read();",
            "            }",
            "            return number * sign;",
            "        }",
            "",
            "        public long nextLong() throws IOException {",
            "            long number = 0; int sign = 1, c = read();",
            "            while (c <= ' ') c = read();",
            "            if (c == '-') { sign = -1; c = read(); }",
            "            while (c >= '0' && c <= '9') {",
            "                number = number * 10 + (c - '0');",
            "                c = read();",
            "            }",
            "            return number * sign;",
            "        }",
            "",
            "        public float nextFloat() throws IOException {",
            "            return Float.parseFloat(next());",
            "        }",
            "",
            "        public double nextDouble() throws IOException {",
            "            return Double.parseDouble(next());",
            "        }",
            "",
            "        public String next() throws IOException {",
            "            int c = read();",
            "            while (c <= ' ') c = read();",
            "            StringBuilder sb = new StringBuilder();",
            "            while (c > ' ') {",
            "                sb.append((char) c);",
            "                c = read();",
            "            }",
            "            return sb.toString();",
            "        }",
            "",
            "        public String nextLine() throws IOException {",
            "            StringBuilder sb = new StringBuilder();",
            "            int c = read();",
            "            while (c != '\\n' && c != -1) {",
            "                sb.append((char) c);",
            "                c = read();",
            "            }",
            "            return sb.toString();",
            "        }",
            "    }",
            "",
            "    static class FastWriter {",
            "        private final BufferedWriter bw;",
            "",
            "        public FastWriter() {",
            "            bw = new BufferedWriter(new OutputStreamWriter(System.out));",
            "        }",
            "",
            "        public void print(Object o) throws IOException {",
            "            bw.write(o.toString());",
            "        }",
            "",
            "        public void println(Object o) throws IOException {",
            "            bw.write(o.toString());",
            "            bw.write('\\n');",
            "        }",
            "",
            "        public void flush() throws IOException {",
            "            bw.flush();",
            "        }",
            "",
            "        public void close() throws IOException {",
            "            bw.close();",
            "        }",
            "    }",
            "",
            "    static void solve(FastReader sc, FastWriter out) throws IOException {",
            "", "        "
        }),
        i(1, "        // Your code here"), -- Cursor inside solve method
        t({
            "",
            "", "    }",
            "",
            "    public static void main(String[] args) throws IOException {",
            "        FastReader sc = new FastReader();",
            "        FastWriter out = new FastWriter();",
            "",
            "        solve(sc, out);",
            "",
            "        out.flush();",
            "        out.close();",
            "    }",
            "}"
        })
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
