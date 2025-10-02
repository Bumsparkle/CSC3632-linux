import os

ATTACKS_DIR = '../known-cyber-attacks'
OUTPUT_FILE = 'COMPILE.md'

def compile_attacks(directory, output_file):

    if not os.path.exists(directory):
        print(f"Directory '{directory}' does not exist.")
        return

    with open(output_file, 'w') as outfile:
        print(f"Compiling markdown files from '{directory}' into '{output_file}'")

        # os.walk goes through all directories and subdirectories.
        for root, dirs, files in os.walk(ATTACKS_DIR):
            for filename in files:
                # Check if the file is a Markdown file.
                if filename.endswith('.md'):
                    # Create the full path to the file.
                    file_path = os.path.join(root, filename)

                    try:
                        # Open the individual attack file to read its content.
                        with open(file_path, 'r', encoding='utf-8') as infile:
                            print(f"Adding content from: {file_path}")

                            # Write the attack's title as a header in the compiled file.
                            # This makes the final file much easier to read.
                            # The '[:-3]' removes the '.md' from the filename for a clean title.
                            outfile.write(f"# {filename[:-3]}\n\n")

                            # Write the content of the attack file.
                            outfile.write(infile.read())

                            # Add a horizontal rule and some newlines for separation.
                            outfile.write('\n\n---\n\n')

                    except Exception as e:
                        print(f"  - Could not read file {file_path}: {e}")
    print(f"Compilation complete. Output written to '{output_file}'")

if __name__ == "__main__":
    compile_attacks(ATTACKS_DIR, OUTPUT_FILE)

