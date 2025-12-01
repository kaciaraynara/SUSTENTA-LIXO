# unit_test.py
# Exemplo de Teste Unitário (Simulação Python) para validar a criação de relato.

def test_validacao_relato():
    """Verifica se o relato possui todos os campos obrigatórios."""
    
    # Simula um payload de relato válido
    relato_valido = {
        "descricao": "Lixo na calçada",
        "latitude": -3.74,
        "longitude": -38.52,
        "userId": "usuario_teste_123"
    }
    
    # Assertiva: O teste espera que a função retorne True para um relato válido
    assert validar_relato(relato_valido) == True, "O relato válido deve ser aceito."

def validar_relato(dados):
    """Função de simulação de validação de dados"""
    # Critérios de validação: descricao, latitude e userId são obrigatórios
    if not dados.get("descricao") or not dados.get("latitude") or not dados.get("userId"):
        return False
    return True

# Execução do teste
test_validacao_relato()
print("Teste Unitário de Validação de Relato Executado com Sucesso.")