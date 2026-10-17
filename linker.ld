ENTRY(_start)

SECTIONS
{
    /* PROVISIONAL ONLY: confirm the physical load address from a real boot protocol. */
    . = 0x40080000;

    .text : ALIGN(4096)
    {
        KEEP(*(.text.boot))
        *(.text .text.*)
    }

    .rodata : ALIGN(4096)
    {
        *(.rodata .rodata.*)
    }

    .data : ALIGN(4096)
    {
        *(.data .data.*)
    }

    .bss (NOLOAD) : ALIGN(4096)
    {
        *(.bss.stack)
        *(.bss .bss.*)
        *(COMMON)
    }
}
