#include <stdio.h>
#include <stdlib.h>

#include <MissingNo/MissingNo.h>

int main(int argc, char* argv[]) {
    mn_u8* buffer = calloc(1, 0x200000);
    MissingNoCore* ctx = calloc(1, missingno_core_size());
    
    FILE* ROM_file = fopen(argv[1], "rb");
    fread(buffer, sizeof(mn_u8), 2 * 1024 * 1024, ROM_file);
    fclose(ROM_file);

    missingno_init(ctx, buffer);

    if (missingno_verify(ctx) != MN_OK)
        printf("Error\n");

    char write_back_buffer[16];
    missingno_game_title(ctx, write_back_buffer);

    printf("%s\n", write_back_buffer);

    printf("Hello World\n");
    return 0;
}
