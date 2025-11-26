const express = require('express');
const cors = require('cors');
const app = express();

// Configuração básica
app.use(cors());
app.use(express.json());

// Porta do Servidor
const PORT = process.env.PORT || 3000;

// Rota de Teste (Health Check)
app.get('/', (req, res) => {
    res.json({ message: 'API Sustenta CE está online', status: 'OK' });
});

// Rotas de Autenticação (Simulação)
app.post('/api/auth/login', (req, res) => {
    // Lógica de login seria implementada aqui
    res.json({ token: 'token-simulado-jwt', user: { id: 1, name: 'Gestor' } });
});

// Rotas de Relatos (Simulação)
app.get('/api/relatos', (req, res) => {
    // Retornaria dados do PostgreSQL
    res.json([{ id: 1, descricao: 'Lixo acumulado', lat: -3.74, lon: -38.52 }]);
});

app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});