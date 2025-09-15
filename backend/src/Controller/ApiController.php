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
    try {
        $reference = $database->getReference('/pomiar');
        $data = $reference->getValue();
        return $this->json($data);
    } catch (\Throwable $e) {
        return $this->json(['error' => $e->getMessage()], 500);
    }
}

}
