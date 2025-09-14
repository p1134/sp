<?php

namespace App\Controller;

use Kreait\Firebase\Contract\Database;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class ApiController extends AbstractController
{
    #[Route('/api/data', name: 'firebase_data')]
    public function index(Database $database): JsonResponse
    {
        $reference = $database->getReference('users/paulina');
        $data = $reference->getValue();

        return $this->json($data);
    }
}
