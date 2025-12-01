# 🚀 Prompt Engineering - Migração Sustenta Lixo: React Native → Web (Express + React + Firebase)

## 📋 RESUMO EXECUTIVO

**Projeto Atual:** Expo/React Native (Mobile - iOS/Android)  
**Projeto Alvo:** Web Stack com Express.js (Backend) + React.js (Frontend) + Firebase (Database)  
**Objetivo:** Reproduzir 100% da funcionalidade com estrutura profissional escalável

---

## 🔁 Atualizações recentes (01/12/2025)

Essas mudanças foram aplicadas ao repositório antes da geração deste prompt e devem ser refletidas na migração para web:

- **Variáveis de ambiente:** As credenciais do Firebase e a chave do Google Maps foram movidas para variáveis de ambiente. Foram adicionados arquivos de exemplo e instruções de setup.
- **Novos arquivos criados:** `./.env.example`, `./.env.local` (arquivo real, gitignored) e `SETUP.md` com instruções detalhadas.
- **Refatorações:** Os serviços que continham credenciais hardcoded foram atualizados para ler as variáveis de ambiente: `services/firebase.ts`, `services/auth.ts` e `services/location.ts`.
- **Segurança e git:** Atualizado `.gitignore` para ignorar arquivos de ambiente locais e instruído o uso de `.env.example` como template seguro.
- **Scripts:** Adicionado `npm run setup` que copia o template `.env.example` para `.env.local` e orienta preencher as credenciais.
- **Docs atualizados:** `README.md` e `SETUP.md` foram adicionados/atualizados para documentar o processo de configuração e segurança.

Observações operacionais:
- O código agora valida presença das variáveis essenciais e lança um erro claro quando faltarem (mensagem orienta a copiar `.env.example` para `.env.local`).
- Ao migrar para a arquitetura web (Express + React), mantenha a mesma prática: nunca committar arquivos que contenham chaves/segredos.

## 🔐 Exemplo de `.env` (template)

Use este exemplo como referência ao preencher seu `.env.local` (não committar):

```env
# Firebase Configuration
EXPO_PUBLIC_FIREBASE_API_KEY=your_api_key_here
EXPO_PUBLIC_FIREBASE_AUTH_DOMAIN=your_project.firebaseapp.com
EXPO_PUBLIC_FIREBASE_PROJECT_ID=your_project_id
EXPO_PUBLIC_FIREBASE_STORAGE_BUCKET=your_project.appspot.com
EXPO_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=your_messaging_sender_id
EXPO_PUBLIC_FIREBASE_APP_ID=your_app_id
EXPO_PUBLIC_FIREBASE_MEASUREMENT_ID=optional_measurement_id

# App Configuration
EXPO_PUBLIC_APP_NAME=SustentaLixo
EXPO_PUBLIC_APP_VERSION=1.0.0

# Google Maps API (para Geocoding)
EXPO_PUBLIC_GOOGLE_MAPS_API_KEY=your_google_maps_api_key

# Environment
NODE_ENV=development
```

Coloque valores reais apenas em `.env.local` e mantenha o arquivo fora do controle de versão.


## 🏗️ ARQUITETURA ALVO

```
sustentalixo-web/
├── backend/                    # Express.js Server
│   ├── src/
│   │   ├── server.ts
│   │   ├── config/
│   │   │   ├── firebase.ts
│   │   │   └── env.ts
│   │   ├── controllers/
│   │   │   ├── auth.controller.ts
│   │   │   ├── trashpoints.controller.ts
│   │   │   ├── complaints.controller.ts
│   │   │   └── users.controller.ts
│   │   ├── services/
│   │   │   ├── auth.service.ts
│   │   │   ├── trashpoints.service.ts
│   │   │   ├── complaints.service.ts
│   │   │   ├── image.service.ts
│   │   │   └── location.service.ts
│   │   ├── middleware/
│   │   │   ├── auth.middleware.ts
│   │   │   ├── errorHandler.ts
│   │   │   └── validator.ts
│   │   ├── routes/
│   │   │   ├── auth.routes.ts
│   │   │   ├── trashpoints.routes.ts
│   │   │   ├── complaints.routes.ts
│   │   │   └── users.routes.ts
│   │   ├── types/
│   │   │   └── index.ts
│   │   └── utils/
│   │       └── logger.ts
│   ├── package.json
│   └── tsconfig.json
│
├── frontend/                   # React.js Client
│   ├── src/
│   │   ├── App.tsx
│   │   ├── main.tsx
│   │   ├── pages/
│   │   │   ├── LoginPage.tsx
│   │   │   ├── RegisterPage.tsx
│   │   │   ├── ReportPage.tsx
│   │   │   ├── TrashPointsPage.tsx
│   │   │   ├── MapPage.tsx
│   │   │   └── ProfilePage.tsx
│   │   ├── components/
│   │   │   ├── Layout/
│   │   │   │   ├── Header.tsx
│   │   │   │   ├── Sidebar.tsx
│   │   │   │   └── Layout.tsx
│   │   │   ├── Common/
│   │   │   │   ├── Button.tsx
│   │   │   │   ├── Card.tsx
│   │   │   │   ├── Modal.tsx
│   │   │   │   └── LoadingSpinner.tsx
│   │   │   ├── Forms/
│   │   │   │   ├── LoginForm.tsx
│   │   │   │   ├── RegisterForm.tsx
│   │   │   │   ├── ReportForm.tsx
│   │   │   │   └── FilterBar.tsx
│   │   │   └── Map/
│   │   │       └── TrashPointsMap.tsx
│   │   ├── services/
│   │   │   ├── api.ts
│   │   │   ├── auth.ts
│   │   │   ├── trashpoints.ts
│   │   │   ├── complaints.ts
│   │   │   ├── location.ts
│   │   │   └── image.ts
│   │   ├── contexts/
│   │   │   ├── AuthContext.tsx
│   │   │   └── SocketContext.tsx
│   │   ├── hooks/
│   │   │   ├── useAuth.ts
│   │   │   ├── useLocation.ts
│   │   │   └── useTrashPoints.ts
│   │   ├── store/
│   │   │   └── slices/
│   │   │       ├── auth.slice.ts
│   │   │       ├── trashpoints.slice.ts
│   │   │       └── ui.slice.ts
│   │   ├── styles/
│   │   │   ├── globals.css
│   │   │   └── theme.ts
│   │   └── utils/
│   │       └── formatters.ts
│   ├── package.json
│   └── tsconfig.json
│
└── docker-compose.yml
```

---

## 📦 TIPOS (TypeScript Compartilhados)

### Backend `src/types/index.ts`

```typescript
// USER TYPES
export interface User {
  id: string;
  email: string;
  name: string;
  municipality?: string;
  createdAt: Date;
  updatedAt: Date;
  profileImageUrl?: string;
  reportCount: number;
  resolvedCount: number;
}

export interface AuthTokens {
  accessToken: string;
  refreshToken: string;
  expiresIn: number;
}

// TRASH POINT TYPES
export type SeverityLevel = 'low' | 'medium' | 'high';
export type TrashPointStatus = 'reported' | 'in_progress' | 'resolved';

export interface TrashPoint {
  id: string;
  latitude: number;
  longitude: number;
  address: string;
  description: string;
  imageStorageUrl?: string;
  imageBase64?: string;
  thumbnailBase64?: string;
  createdAt: Date;
  updatedAt: Date;
  status: TrashPointStatus;
  userId: string;
  severity: SeverityLevel;
  resolvedAt?: Date;
  resolvedBy?: string;
  comments: Comment[];
}

// COMPLAINT TYPES
export interface Complaint {
  id: string;
  trashPointId: string;
  municipality: string;
  message: string;
  createdAt: Date;
  updatedAt: Date;
  status: 'pending' | 'sent' | 'error';
  userId: string;
}

// COMMENT TYPES
export interface Comment {
  id: string;
  userId: string;
  userName: string;
  trashPointId: string;
  message: string;
  createdAt: Date;
}

// LOCATION TYPES
export interface LocationData {
  latitude: number;
  longitude: number;
  address: string;
}

// API RESPONSE TYPES
export interface ApiResponse<T> {
  success: boolean;
  data?: T;
  error?: string;
  timestamp: Date;
}

export interface PaginatedResponse<T> {
  data: T[];
  pagination: {
    page: number;
    limit: number;
    total: number;
    totalPages: number;
  };
}

// FILTER TYPES
export interface TrashPointFilters {
  severity?: SeverityLevel | 'all';
  status?: TrashPointStatus | 'all';
  dateRange?: 'all' | 'today' | 'week' | 'month';
  searchQuery?: string;
  sortBy?: 'date' | 'severity' | 'distance';
  latitude?: number;
  longitude?: number;
  radiusKm?: number;
  page?: number;
  limit?: number;
}
```

---

## 🔐 AUTENTICAÇÃO

### Backend: `src/services/auth.service.ts`

```typescript
import { auth, db } from '../config/firebase';
import {
  createUserWithEmailAndPassword,
  signInWithEmailAndPassword,
  signOut,
  updateProfile,
} from 'firebase/auth';
import { collection, doc, setDoc, getDoc, updateDoc } from 'firebase/firestore';
import jwt from 'jsonwebtoken';
import { User, AuthTokens } from '../types';

export class AuthService {
  private readonly JWT_SECRET = process.env.JWT_SECRET!;
  private readonly JWT_REFRESH_SECRET = process.env.JWT_REFRESH_SECRET!;

  async register(
    email: string,
    password: string,
    name: string,
    municipality?: string
  ): Promise<{ user: User; tokens: AuthTokens }> {
    try {
      // Criar usuário no Firebase Auth
      const userCredential = await createUserWithEmailAndPassword(auth, email, password);
      const firebaseUser = userCredential.user;

      // Atualizar perfil com nome
      await updateProfile(firebaseUser, { displayName: name });

      // Criar documento no Firestore
      const newUser: User = {
        id: firebaseUser.uid,
        email,
        name,
        municipality,
        createdAt: new Date(),
        updatedAt: new Date(),
        reportCount: 0,
        resolvedCount: 0,
      };

      await setDoc(doc(db, 'users', firebaseUser.uid), newUser);

      const tokens = this.generateTokens(firebaseUser.uid, email);
      return { user: newUser, tokens };
    } catch (error: any) {
      throw new Error(`Erro ao registrar: ${error.message}`);
    }
  }

  async login(email: string, password: string): Promise<{ user: User; tokens: AuthTokens }> {
    try {
      const userCredential = await signInWithEmailAndPassword(auth, email, password);
      const firebaseUser = userCredential.user;

      // Buscar dados do usuário no Firestore
      const userDoc = await getDoc(doc(db, 'users', firebaseUser.uid));
      const user = userDoc.data() as User;

      const tokens = this.generateTokens(firebaseUser.uid, email);
      return { user, tokens };
    } catch (error: any) {
      throw new Error(`Erro ao fazer login: ${error.message}`);
    }
  }

  async logout(userId: string): Promise<void> {
    try {
      await signOut(auth);
    } catch (error: any) {
      throw new Error(`Erro ao fazer logout: ${error.message}`);
    }
  }

  private generateTokens(userId: string, email: string): AuthTokens {
    const accessToken = jwt.sign(
      { userId, email },
      this.JWT_SECRET,
      { expiresIn: '1h' }
    );

    const refreshToken = jwt.sign(
      { userId, email },
      this.JWT_REFRESH_SECRET,
      { expiresIn: '7d' }
    );

    return {
      accessToken,
      refreshToken,
      expiresIn: 3600,
    };
  }

  async refreshToken(refreshToken: string): Promise<AuthTokens> {
    try {
      const decoded = jwt.verify(refreshToken, this.JWT_REFRESH_SECRET) as any;
      const tokens = this.generateTokens(decoded.userId, decoded.email);
      return tokens;
    } catch (error) {
      throw new Error('Token inválido');
    }
  }

  async updateUserProfile(userId: string, updates: Partial<User>): Promise<User> {
    try {
      const userRef = doc(db, 'users', userId);
      await updateDoc(userRef, {
        ...updates,
        updatedAt: new Date(),
      });

      const updatedDoc = await getDoc(userRef);
      return updatedDoc.data() as User;
    } catch (error: any) {
      throw new Error(`Erro ao atualizar perfil: ${error.message}`);
    }
  }
}
```

### Backend: `src/controllers/auth.controller.ts`

```typescript
import { Request, Response, NextFunction } from 'express';
import { AuthService } from '../services/auth.service';
import { ApiResponse } from '../types';

export class AuthController {
  private authService = new AuthService();

  async register(req: Request, res: Response, next: NextFunction) {
    try {
      const { email, password, name, municipality } = req.body;

      const result = await this.authService.register(email, password, name, municipality);

      const response: ApiResponse<typeof result> = {
        success: true,
        data: result,
        timestamp: new Date(),
      };

      res.status(201).json(response);
    } catch (error) {
      next(error);
    }
  }

  async login(req: Request, res: Response, next: NextFunction) {
    try {
      const { email, password } = req.body;

      const result = await this.authService.login(email, password);

      res.cookie('refreshToken', result.tokens.refreshToken, {
        httpOnly: true,
        secure: process.env.NODE_ENV === 'production',
        sameSite: 'strict',
        maxAge: 7 * 24 * 60 * 60 * 1000,
      });

      const response: ApiResponse<typeof result> = {
        success: true,
        data: result,
        timestamp: new Date(),
      };

      res.status(200).json(response);
    } catch (error) {
      next(error);
    }
  }

  async logout(req: Request, res: Response, next: NextFunction) {
    try {
      const userId = (req as any).userId;
      await this.authService.logout(userId);

      res.clearCookie('refreshToken');

      const response: ApiResponse<null> = {
        success: true,
        data: null,
        timestamp: new Date(),
      };

      res.status(200).json(response);
    } catch (error) {
      next(error);
    }
  }

  async refreshToken(req: Request, res: Response, next: NextFunction) {
    try {
      const refreshToken = req.cookies.refreshToken;

      if (!refreshToken) {
        throw new Error('Refresh token não encontrado');
      }

      const tokens = await this.authService.refreshToken(refreshToken);

      res.cookie('refreshToken', tokens.refreshToken, {
        httpOnly: true,
        secure: process.env.NODE_ENV === 'production',
        sameSite: 'strict',
        maxAge: 7 * 24 * 60 * 60 * 1000,
      });

      const response: ApiResponse<typeof tokens> = {
        success: true,
        data: tokens,
        timestamp: new Date(),
      };

      res.status(200).json(response);
    } catch (error) {
      next(error);
    }
  }

  async updateProfile(req: Request, res: Response, next: NextFunction) {
    try {
      const userId = (req as any).userId;
      const updates = req.body;

      const user = await this.authService.updateUserProfile(userId, updates);

      const response: ApiResponse<typeof user> = {
        success: true,
        data: user,
        timestamp: new Date(),
      };

      res.status(200).json(response);
    } catch (error) {
      next(error);
    }
  }
}
```

---

## 🗑️ TRASH POINTS (PONTOS DE LIXO)

### Backend: `src/services/trashpoints.service.ts`

```typescript
import {
  collection,
  addDoc,
  getDocs,
  getDoc,
  doc,
  query,
  where,
  orderBy,
  limit,
  startAfter,
  updateDoc,
  Query,
} from 'firebase/firestore';
import { db, storage } from '../config/firebase';
import { ref, uploadBytes, getDownloadURL } from 'firebase/storage';
import { TrashPoint, TrashPointFilters, PaginatedResponse } from '../types';
import { ImageService } from './image.service';

export class TrashPointService {
  private imageService = new ImageService();

  async createTrashPoint(
    data: Omit<TrashPoint, 'id' | 'createdAt' | 'updatedAt' | 'comments'>,
    imageFile?: Express.Multer.File,
    userId?: string
  ): Promise<TrashPoint> {
    try {
      let imageStorageUrl: string | undefined;

      // Comprimir imagem se fornecida
      if (imageFile) {
        const compressedBuffer = await this.imageService.compressImage(
          imageFile.buffer,
          imageFile.mimetype
        );

        // Upload para Firebase Storage
        const storageRef = ref(storage, `images/trashpoints/${Date.now()}-${imageFile.originalname}`);
        await uploadBytes(storageRef, compressedBuffer, { contentType: 'image/jpeg' });
        imageStorageUrl = await getDownloadURL(storageRef);
      }

      const newTrashPoint: Omit<TrashPoint, 'id'> = {
        ...data,
        imageStorageUrl,
        createdAt: new Date(),
        updatedAt: new Date(),
        comments: [],
      };

      const docRef = await addDoc(collection(db, 'trashPoints'), newTrashPoint);

      return {
        id: docRef.id,
        ...newTrashPoint,
      };
    } catch (error: any) {
      throw new Error(`Erro ao criar ponto de lixo: ${error.message}`);
    }
  }

  async getTrashPoints(filters: TrashPointFilters): Promise<PaginatedResponse<TrashPoint>> {
    try {
      const {
        severity,
        status,
        searchQuery,
        sortBy = 'date',
        latitude,
        longitude,
        radiusKm = 50,
        page = 1,
        limit: pageLimit = 20,
      } = filters;

      let q: Query = collection(db, 'trashPoints');
      const constraints = [];

      // Filtros
      if (severity && severity !== 'all') {
        constraints.push(where('severity', '==', severity));
      }
      if (status && status !== 'all') {
        constraints.push(where('status', '==', status));
      }

      // Ordenação
      if (sortBy === 'date') {
        constraints.push(orderBy('createdAt', 'desc'));
      } else if (sortBy === 'severity') {
        const severityOrder = { high: 3, medium: 2, low: 1 };
        constraints.push(orderBy('severity', 'desc'));
      }

      constraints.push(limit(pageLimit * 10)); // Buscar mais para filtrar por distância

      if (constraints.length > 0) {
        q = query(collection(db, 'trashPoints'), ...constraints);
      }

      const querySnapshot = await getDocs(q);

      let points = querySnapshot.docs.map((doc) => ({
        id: doc.id,
        ...doc.data(),
        createdAt: doc.data().createdAt?.toDate() || new Date(),
        updatedAt: doc.data().updatedAt?.toDate() || new Date(),
      })) as TrashPoint[];

      // Filtrar por distância se coordenadas fornecidas
      if (latitude && longitude && radiusKm) {
        points = points.filter((point) => {
          const distance = this.calculateDistance(latitude, longitude, point.latitude, point.longitude);
          return distance <= radiusKm;
        });
      }

      // Filtrar por texto de busca
      if (searchQuery) {
        const query = searchQuery.toLowerCase();
        points = points.filter(
          (p) =>
            p.description.toLowerCase().includes(query) ||
            p.address.toLowerCase().includes(query)
        );
      }

      // Paginação
      const totalItems = points.length;
      const startIndex = (page - 1) * pageLimit;
      const paginatedPoints = points.slice(startIndex, startIndex + pageLimit);

      return {
        data: paginatedPoints,
        pagination: {
          page,
          limit: pageLimit,
          total: totalItems,
          totalPages: Math.ceil(totalItems / pageLimit),
        },
      };
    } catch (error: any) {
      throw new Error(`Erro ao buscar pontos: ${error.message}`);
    }
  }

  async getTrashPointById(id: string): Promise<TrashPoint> {
    try {
      const docRef = doc(db, 'trashPoints', id);
      const docSnap = await getDoc(docRef);

      if (!docSnap.exists()) {
        throw new Error('Ponto não encontrado');
      }

      return {
        id: docSnap.id,
        ...docSnap.data(),
        createdAt: docSnap.data().createdAt?.toDate() || new Date(),
        updatedAt: docSnap.data().updatedAt?.toDate() || new Date(),
      } as TrashPoint;
    } catch (error: any) {
      throw new Error(`Erro ao buscar ponto: ${error.message}`);
    }
  }

  async updateTrashPoint(id: string, updates: Partial<TrashPoint>): Promise<TrashPoint> {
    try {
      const docRef = doc(db, 'trashPoints', id);
      await updateDoc(docRef, {
        ...updates,
        updatedAt: new Date(),
      });

      return this.getTrashPointById(id);
    } catch (error: any) {
      throw new Error(`Erro ao atualizar ponto: ${error.message}`);
    }
  }

  private calculateDistance(lat1: number, lon1: number, lat2: number, lon2: number): number {
    const R = 6371; // Raio da terra em km
    const dLat = ((lat2 - lat1) * Math.PI) / 180;
    const dLon = ((lon2 - lon1) * Math.PI) / 180;
    const a =
      Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.cos((lat1 * Math.PI) / 180) *
        Math.cos((lat2 * Math.PI) / 180) *
        Math.sin(dLon / 2) *
        Math.sin(dLon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c;
  }
}
```

### Backend: `src/controllers/trashpoints.controller.ts`

```typescript
import { Request, Response, NextFunction } from 'express';
import { TrashPointService } from '../services/trashpoints.service';
import { ApiResponse, PaginatedResponse, TrashPoint } from '../types';

export class TrashPointController {
  private trashPointService = new TrashPointService();

  async create(req: Request, res: Response, next: NextFunction) {
    try {
      const userId = (req as any).userId;
      const { latitude, longitude, address, description, severity } = req.body;
      const imageFile = (req as any).file;

      const trashPoint = await this.trashPointService.createTrashPoint(
        {
          latitude: parseFloat(latitude),
          longitude: parseFloat(longitude),
          address,
          description,
          severity,
          status: 'reported',
          userId,
        },
        imageFile,
        userId
      );

      const response: ApiResponse<TrashPoint> = {
        success: true,
        data: trashPoint,
        timestamp: new Date(),
      };

      res.status(201).json(response);
    } catch (error) {
      next(error);
    }
  }

  async getAll(req: Request, res: Response, next: NextFunction) {
    try {
      const filters = {
        severity: req.query.severity as any,
        status: req.query.status as any,
        searchQuery: req.query.search as string,
        sortBy: (req.query.sortBy as any) || 'date',
        latitude: req.query.latitude ? parseFloat(req.query.latitude as string) : undefined,
        longitude: req.query.longitude ? parseFloat(req.query.longitude as string) : undefined,
        radiusKm: req.query.radiusKm ? parseFloat(req.query.radiusKm as string) : 50,
        page: req.query.page ? parseInt(req.query.page as string) : 1,
        limit: req.query.limit ? parseInt(req.query.limit as string) : 20,
      };

      const result = await this.trashPointService.getTrashPoints(filters);

      const response: ApiResponse<PaginatedResponse<TrashPoint>> = {
        success: true,
        data: result,
        timestamp: new Date(),
      };

      res.status(200).json(response);
    } catch (error) {
      next(error);
    }
  }

  async getById(req: Request, res: Response, next: NextFunction) {
    try {
      const { id } = req.params;
      const trashPoint = await this.trashPointService.getTrashPointById(id);

      const response: ApiResponse<TrashPoint> = {
        success: true,
        data: trashPoint,
        timestamp: new Date(),
      };

      res.status(200).json(response);
    } catch (error) {
      next(error);
    }
  }

  async update(req: Request, res: Response, next: NextFunction) {
    try {
      const { id } = req.params;
      const updates = req.body;

      const trashPoint = await this.trashPointService.updateTrashPoint(id, updates);

      const response: ApiResponse<TrashPoint> = {
        success: true,
        data: trashPoint,
        timestamp: new Date(),
      };

      res.status(200).json(response);
    } catch (error) {
      next(error);
    }
  }
}
```

---

## 🖼️ PÁGINAS FRONTEND (React)

### `frontend/src/pages/ReportPage.tsx`

```typescript
import React, { useState, useCallback } from 'react';
import { useAuth } from '../hooks/useAuth';
import { useLocation } from '../hooks/useLocation';
import { trashpointsApi } from '../services/trashpoints';
import { Button } from '../components/Common/Button';
import { Card } from '../components/Common/Card';
import './ReportPage.css';

export const ReportPage: React.FC = () => {
  const { user } = useAuth();
  const { location, getLocation } = useLocation();

  const [description, setDescription] = useState('');
  const [severity, setSeverity] = useState<'low' | 'medium' | 'high'>('medium');
  const [imageFile, setImageFile] = useState<File | null>(null);
  const [imagePreview, setImagePreview] = useState<string>('');
  const [isLoading, setIsLoading] = useState(false);

  const handleImageSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) {
      setImageFile(file);
      const reader = new FileReader();
      reader.onload = (event) => {
        setImagePreview(event.target?.result as string);
      };
      reader.readAsDataURL(file);
    }
  };

  const handleSubmit = useCallback(async () => {
    if (!user || !location || !description.trim() || !imageFile) {
      alert('Preencha todos os campos obrigatórios');
      return;
    }

    try {
      setIsLoading(true);

      const formData = new FormData();
      formData.append('latitude', location.latitude.toString());
      formData.append('longitude', location.longitude.toString());
      formData.append('address', location.address);
      formData.append('description', description);
      formData.append('severity', severity);
      formData.append('image', imageFile);

      const result = await trashpointsApi.create(formData);

      alert('✅ Ponto reportado com sucesso!');
      
      // Resetar formulário
      setDescription('');
      setSeverity('medium');
      setImageFile(null);
      setImagePreview('');
    } catch (error: any) {
      alert(`❌ Erro: ${error.message}`);
    } finally {
      setIsLoading(false);
    }
  }, [user, location, description, severity, imageFile]);

  return (
    <div className="report-page">
      <div className="report-header">
        <h1>🚮 Reportar Ponto de Lixo</h1>
        <p>Ajude a manter sua cidade limpa</p>
      </div>

      <Card>
        {/* Seção de Localização */}
        <div className="form-section">
          <h2>📍 Localização</h2>
          <Button onClick={getLocation} disabled={isLoading}>
            {location ? '✅ Localização Obtida' : '📌 Obter Localização'}
          </Button>
          {location && (
            <div className="location-info">
              <p><strong>Endereço:</strong> {location.address}</p>
              <p><strong>Coordenadas:</strong> {location.latitude.toFixed(6)}, {location.longitude.toFixed(6)}</p>
            </div>
          )}
        </div>

        {/* Seção de Imagem */}
        <div className="form-section">
          <h2>📸 Foto do Local</h2>
          <label className="image-input">
            <input
              type="file"
              accept="image/*"
              onChange={handleImageSelect}
              disabled={isLoading}
            />
            <span>{imageFile ? '✏️ Alterar Imagem' : '📷 Selecionar Imagem'}</span>
          </label>
          {imagePreview && (
            <div className="image-preview">
              <img src={imagePreview} alt="preview" />
            </div>
          )}
        </div>

        {/* Seção de Descrição */}
        <div className="form-section">
          <h2>📝 Descrição</h2>
          <textarea
            value={description}
            onChange={(e) => setDescription(e.target.value)}
            placeholder="Descreva o tipo e quantidade de lixo encontrado..."
            maxLength={500}
            disabled={isLoading}
          />
          <p className="char-count">{description.length}/500 caracteres</p>
        </div>

        {/* Seção de Gravidade */}
        <div className="form-section">
          <h2>⚠️ Gravidade</h2>
          <div className="severity-buttons">
            {[
              { level: 'low', label: 'Baixa', icon: '🟢' },
              { level: 'medium', label: 'Média', icon: '🟠' },
              { level: 'high', label: 'Alta', icon: '🔴' },
            ].map(({ level, label, icon }) => (
              <button
                key={level}
                className={`severity-btn ${severity === level ? 'active' : ''}`}
                onClick={() => setSeverity(level as any)}
                disabled={isLoading}
              >
                {icon} {label}
              </button>
            ))}
          </div>
        </div>

        {/* Botão de Submissão */}
        <Button
          onClick={handleSubmit}
          disabled={!location || !imageFile || !description.trim() || isLoading}
          className="submit-btn"
        >
          {isLoading ? 'Enviando...' : '📨 Enviar Denúncia'}
        </Button>
      </Card>
    </div>
  );
};
```

### `frontend/src/pages/TrashPointsPage.tsx`

```typescript
import React, { useState, useEffect, useCallback } from 'react';
import { useAuth } from '../hooks/useAuth';
import { trashpointsApi } from '../services/trashpoints';
import { TrashPoint, TrashPointFilters } from '../types';
import { TrashPointCard } from '../components/TrashPointCard';
import { FilterBar } from '../components/Forms/FilterBar';
import './TrashPointsPage.css';

export const TrashPointsPage: React.FC = () => {
  const { user } = useAuth();
  const [trashPoints, setTrashPoints] = useState<TrashPoint[]>([]);
  const [loading, setLoading] = useState(true);
  const [filters, setFilters] = useState<TrashPointFilters>({
    severity: 'all',
    status: 'all',
    sortBy: 'date',
    page: 1,
    limit: 20,
  });

  const loadTrashPoints = useCallback(async () => {
    try {
      setLoading(true);
      const response = await trashpointsApi.getAll(filters);
      setTrashPoints(response.data);
    } catch (error) {
      console.error('Erro ao carregar pontos:', error);
    } finally {
      setLoading(false);
    }
  }, [filters]);

  useEffect(() => {
    loadTrashPoints();
  }, [loadTrashPoints]);

  const handleFilterChange = (newFilters: Partial<TrashPointFilters>) => {
    setFilters((prev) => ({ ...prev, ...newFilters, page: 1 }));
  };

  if (loading) {
    return <div className="loading">Carregando...</div>;
  }

  return (
    <div className="trashpoints-page">
      <h1>🗑️ Pontos de Lixo</h1>

      <FilterBar onFilterChange={handleFilterChange} />

      <div className="trashpoints-grid">
        {trashPoints.length === 0 ? (
          <p className="empty-message">Nenhum ponto encontrado</p>
        ) : (
          trashPoints.map((point) => (
            <TrashPointCard key={point.id} point={point} />
          ))
        )}
      </div>
    </div>
  );
};
```

### `frontend/src/pages/MapPage.tsx`

```typescript
import React, { useEffect, useState } from 'react';
import { MapContainer, TileLayer, Marker, Popup } from 'react-leaflet';
import { trashpointsApi } from '../services/trashpoints';
import { TrashPoint } from '../types';
import 'leaflet/dist/leaflet.css';
import './MapPage.css';

export const MapPage: React.FC = () => {
  const [trashPoints, setTrashPoints] = useState<TrashPoint[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadTrashPoints();
  }, []);

  const loadTrashPoints = async () => {
    try {
      const response = await trashpointsApi.getAll({ limit: 100 });
      setTrashPoints(response.data);
    } catch (error) {
      console.error('Erro ao carregar mapa:', error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return <div className="loading">Carregando mapa...</div>;
  }

  return (
    <div className="map-page">
      <MapContainer center={[-23.5505, -46.6333]} zoom={13} style={{ height: '100vh', width: '100%' }}>
        <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
        {trashPoints.map((point) => (
          <Marker key={point.id} position={[point.latitude, point.longitude]}>
            <Popup>
              <div className="marker-popup">
                <h3>{point.description}</h3>
                <p>{point.address}</p>
                <span className={`severity ${point.severity}`}>{point.severity.toUpperCase()}</span>
              </div>
            </Popup>
          </Marker>
        ))}
      </MapContainer>
    </div>
  );
};
```

### `frontend/src/pages/LoginPage.tsx`

```typescript
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../hooks/useAuth';
import { Button } from '../components/Common/Button';
import { Card } from '../components/Common/Card';
import './LoginPage.css';

export const LoginPage: React.FC = () => {
  const navigate = useNavigate();
  const { login } = useAuth();

  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');

    if (!email || !password) {
      setError('Preencha todos os campos');
      return;
    }

    try {
      setIsLoading(true);
      await login(email, password);
      navigate('/');
    } catch (err: any) {
      setError(err.message || 'Erro ao fazer login');
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="login-page">
      <Card className="login-card">
        <h1>🌍 Sustenta Lixo</h1>
        <h2>Faça login na sua conta</h2>

        {error && <div className="error-message">{error}</div>}

        <form onSubmit={handleSubmit}>
          <input
            type="email"
            placeholder="seu@email.com"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            disabled={isLoading}
          />
          <input
            type="password"
            placeholder="Sua senha"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            disabled={isLoading}
          />
          <Button type="submit" disabled={isLoading} className="submit-btn">
            {isLoading ? 'Entrando...' : 'Entrar'}
          </Button>
        </form>

        <p className="register-link">
          Não tem uma conta? <a href="/register">Cadastre-se</a>
        </p>
      </Card>
    </div>
  );
};
```

---

## 🔌 ROTAS BACKEND (Express)

### `backend/src/routes/trashpoints.routes.ts`

```typescript
import { Router } from 'express';
import multer from 'multer';
import { TrashPointController } from '../controllers/trashpoints.controller';
import { authMiddleware } from '../middleware/auth.middleware';

const router = Router();
const upload = multer({ storage: multer.memoryStorage() });
const controller = new TrashPointController();

// Public routes
router.get('/', (req, res, next) => controller.getAll(req, res, next));
router.get('/:id', (req, res, next) => controller.getById(req, res, next));

// Protected routes
router.post(
  '/',
  authMiddleware,
  upload.single('image'),
  (req, res, next) => controller.create(req, res, next)
);

router.patch('/:id', authMiddleware, (req, res, next) =>
  controller.update(req, res, next)
);

export default router;
```

### `backend/src/server.ts`

```typescript
import express from 'express';
import cors from 'cors';
import cookieParser from 'cookie-parser';
import dotenv from 'dotenv';

import authRoutes from './routes/auth.routes';
import trashpointsRoutes from './routes/trashpoints.routes';
import complaintsRoutes from './routes/complaints.routes';
import { errorHandler } from './middleware/errorHandler';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors({
  origin: process.env.FRONTEND_URL || 'http://localhost:3000',
  credentials: true,
}));
app.use(express.json());
app.use(express.urlencoded({ limit: '50mb', extended: true }));
app.use(cookieParser());

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/trashpoints', trashpointsRoutes);
app.use('/api/complaints', complaintsRoutes);

// Error handling
app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`🚀 Servidor rodando na porta ${PORT}`);
});
```

---

## 🖼️ TRATAMENTO DE IMAGENS

### Backend: `src/services/image.service.ts`

```typescript
import sharp from 'sharp';

export class ImageService {
  async compressImage(
    buffer: Buffer,
    mimeType: string,
    maxWidthPx: number = 800,
    quality: number = 80
  ): Promise<Buffer> {
    try {
      let compressed = sharp(buffer);

      if (mimeType === 'image/png' || mimeType === 'image/webp') {
        compressed = compressed.jpeg({ quality });
      } else {
        compressed = compressed.resize(maxWidthPx, maxWidthPx, {
          fit: 'inside',
          withoutEnlargement: true,
        }).jpeg({ quality });
      }

      return await compressed.toBuffer();
    } catch (error: any) {
      console.error('Erro ao comprimir imagem:', error);
      return buffer; // Retornar original se falhar
    }
  }

  async generateThumbnail(buffer: Buffer, size: number = 200): Promise<Buffer> {
    try {
      return await sharp(buffer)
        .resize(size, size, { fit: 'cover' })
        .jpeg({ quality: 60 })
        .toBuffer();
    } catch (error: any) {
      console.error('Erro ao gerar thumbnail:', error);
      return buffer;
    }
  }
}
```

---

## 📝 RESUMO DE DESENVOLVIMENTO

### Passo a Passo para IA Implementar:

1. **Setup Backend**
   - Criar projeto Express.js com TypeScript
   - Configurar Firebase Admin SDK
   - Implementar autenticação JWT
   - Criar estrutura de pastas (controllers, services, routes, middleware, types)

2. **Implementar Services**
   - AuthService (register, login, refresh, updateProfile)
   - TrashPointService (CRUD, filtros, distância)
   - ComplaintService (criar, listar)
   - ImageService (compressão, upload)
   - LocationService (geocoding)

3. **Criar Controllers**
   - AuthController
   - TrashPointController
   - ComplaintController
   - UserController

4. **Implementar Routes & Middleware**
   - Auth routes (register, login, logout, refresh)
   - TrashPoints routes (CRUD com upload de imagem)
   - Complaints routes
   - Auth middleware (JWT validation)
   - Error handler middleware

5. **Setup Frontend (React)**
   - Criar projeto Vite + React + TypeScript
   - Configurar routing (React Router v6)
   - Criar estrutura de componentes
   - Implementar autenticação com context/Redux
   - Criar páginas (Login, Register, Report, TrashPoints, Map, Profile)
   - Integrar com API backend
   - Implementar mapa com react-leaflet
   - Adicionar tipos TypeScript

6. **Testes & Deploy**
   - Testar endpoints com Postman/Insomnia
   - Testes unitários (Jest)
   - Deploy backend (Vercel, Railway, Render)
   - Deploy frontend (Vercel, Netlify)

---

## 📦 DEPENDENCIES

### Backend `package.json`
```json
{
  "dependencies": {
    "express": "^4.18.2",
    "firebase": "^10.14.1",
    "firebase-admin": "^12.0.0",
    "jsonwebtoken": "^9.1.0",
    "multer": "^1.4.5",
    "sharp": "^0.33.0",
    "cors": "^2.8.5",
    "cookie-parser": "^1.4.6",
    "dotenv": "^16.3.1",
    "axios": "^1.6.0"
  },
  "devDependencies": {
    "@types/express": "^4.17.21",
    "@types/node": "^20.10.6",
    "typescript": "^5.3.3",
    "ts-node": "^10.9.2"
  }
}
```

### Frontend `package.json`
```json
{
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.20.1",
    "@reduxjs/toolkit": "^1.9.7",
    "react-redux": "^8.1.3",
    "axios": "^1.6.2",
    "react-leaflet": "^4.2.1",
    "leaflet": "^1.9.4",
    "typescript": "^5.3.3"
  },
  "devDependencies": {
    "vite": "^5.0.8",
    "@vitejs/plugin-react": "^4.2.1",
    "@types/react": "^18.2.37"
  }
}
```

---

## 🎯 CONCLUSÃO

Este prompt engineering fornece **estrutura completa, tipagem, e exemplos funcionais** para migração de um app React Native/Expo para web com Express + React + Firebase.

Cada componente foi documentado com:
- ✅ Tipos TypeScript exatos
- ✅ Implementação completa
- ✅ Exemplos de uso
- ✅ Estrutura profissional escalável
- ✅ Best practices

A IA pode usar este documento como referência para implementar o projeto web de forma completa e organizada.
