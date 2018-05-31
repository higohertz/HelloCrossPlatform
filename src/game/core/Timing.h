#pragma once

bool QueryPerformanceFrequency( int64_t* frequency );
bool QueryPerformanceCounter( int64_t* performance_count );
void StartTiming();
