#include "Engine.h"

#include "core/Timing.h"
#include <string>

double GetSeconds()
{
	if ( RecipCyclesPerSecond < 0.0f )
	{
		StartTiming();
	}

#ifndef ANDROID
	LARGE_INTEGER T1;
#else
	int64_t T1;
#endif

	QueryPerformanceCounter( &T1 );

#ifndef ANDROID
	return RecipCyclesPerSecond * ( double )( T1.QuadPart );
#else
	return RecipCyclesPerSecond * ( double )( T1 );
#endif
}

void GenerateTicks()
{
	static double NewTime;
	static double OldTime;
	static double ExecutionTime;

	NewTime = GetSeconds();
	float DeltaSeconds = static_cast<float>( NewTime - OldTime );
	OldTime = NewTime;

	const float TIME_QUANTUM = 0.0166666f;
	const float MAX_EXECUTION_TIME = 10.0f * TIME_QUANTUM;

	ExecutionTime += DeltaSeconds;

	if ( ExecutionTime > MAX_EXECUTION_TIME ) { ExecutionTime = MAX_EXECUTION_TIME; }

	while ( ExecutionTime > TIME_QUANTUM )
	{
		ExecutionTime -= TIME_QUANTUM;
		OnTimer( TIME_QUANTUM );
	}

	OnDrawFrame();
}
