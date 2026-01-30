#!/usr/bin/env bash
# status.sh — Gera JSON compatível com i3bar/swaybar
# Cada módulo retorna um bloco JSON; os blocos são concatenados com um espaço entre eles.
# O bar consome este script via status_command.

# Diretórios de módulos
BAR_DIR="$HOME/.config/sway/bar"
MOD_DIR="$BAR_DIR/modules"

# Protocol header
echo '{ "version": 1, "click_events": true }'
echo '['

# Flag para saber se é o primeiro bloco
first=1

# Loop infinito para atualizar status
while :; do
    blocks=() # Lista temporária de blocos JSON

    # Lista de módulos a executar
    for mod in cpu temp ram swap disk network bluetooth volume battery datetime; do
        # Executa módulo e captura saída
        out="$("$MOD_DIR/$mod.sh" 2>/dev/null)"
        # Se o módulo retornou algo, adiciona à lista
        [ -n "$out" ] && blocks+=("$out")
    done

    # Concatena todos os blocos, separando com um espaço
    # Remove a vírgula inicial do join
    json=$(printf ' %s' "${blocks[@]}")
    json="[${json:1}]"

    # Imprime com vírgula apenas se não for o primeiro bloco
    if [ $first -eq 1 ]; then
        echo "$json"
        first=0
    else
        echo ",$json"
    fi

    # Intervalo de atualização em segundos
    sleep 1
done

# Fecha o array (não será atingido)
echo ']'
