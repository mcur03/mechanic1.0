import { Router } from 'express';
import { getAll, getById } from '../controllers/userController';
import { authenticate, authorize } from '../middlewares/authMiddleware';

const router = Router();

router.get('/', authenticate, authorize(['admin']), getAll);
router.get('/:id', authenticate, authorize(['admin']), getById);

export default router;
