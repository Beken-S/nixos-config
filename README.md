### Описание
Моя конфигурация системы для личного использования

### Установка
```bash
   nix-shell -p disko

   sudo disko --mode destroy,format,mount --flake github:Beken-S/nixos-config#uranium

   sudo nixos-install --no-channel-copy --no-root-password --flake github:Beken-S/nixos-config#uranium
```
Для задания пароля пользователя после установки выполнить:
```bash
    nixos-enter --root /mnt -c "passwd <username>"
```

