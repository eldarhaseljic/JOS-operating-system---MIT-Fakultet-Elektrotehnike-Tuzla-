/* See COPYRIGHT for copyright information. */

#ifndef JOS_INC_ENV_H
#define JOS_INC_ENV_H

#include <inc/types.h>
#include <inc/trap.h>
#include <inc/memlayout.h>

typedef int32_t envid_t;

// An environment ID 'envid_t' has three parts:
//
// +1+---------------21-----------------+--------10--------+
// |0|          Uniqueifier             |   Environment    |
// | |                                  |      Index       |
// +------------------------------------+------------------+
//                                       \--- ENVX(eid) --/
//
// The environment index ENVX(eid) equals the environment's index in the
// 'envs[]' array.  The uniqueifier distinguishes environments that were
// created at different times, but share the same environment index.
//
// All real environments are greater than 0 (so the sign bit is zero).
// envid_ts less than 0 signify errors.  The envid_t == 0 is special, and
// stands for the current environment.

#define LOG2NENV		10
#define NENV			(1 << LOG2NENV)             //1024 Evironments
#define ENVX(envid)		((envid) & (NENV - 1))

// Values of env_status in struct Env
enum {
	ENV_FREE = 0,
	ENV_DYING,
	ENV_RUNNABLE,
	ENV_RUNNING,
	ENV_NOT_RUNNABLE
};

// Special environment types
enum EnvType {
	ENV_TYPE_USER = 0,
};

struct Env {
	struct Trapframe env_tf;	// Saved registers
	struct Env *env_link;		// Next free Env
	envid_t env_id;			// Unique environment identifier
	envid_t env_parent_id;		// env_id of this env's parent
	enum EnvType env_type;		// Indicates special system environments
	unsigned env_status;		// Status of the environment
	uint32_t env_runs;		// Number of times environment has run
	int env_cpunum;			// The CPU that the env is running on

	// Address space
	pde_t *env_pgdir;		// Kernel virtual address of page dir

	// Exception handling
	void *env_pgfault_upcall;	// Page fault upcall entry point

	// Lab 4 IPC
	bool env_ipc_recving;		// Env is blocked receiving
	void *env_ipc_dstva;		// VA at which to map received page
	uint32_t env_ipc_value;		// Data value sent to us
	envid_t env_ipc_from;		// envid of the sender
	int env_ipc_perm;		// Perm of page mapping received

/*
  struct Trapframe env_tf;	  // Saved registers

	  //Ova struktura snima vrijednosti registara okruzenja kada okruzenje je not 
    //running tj. kada kernel ili je neko drugo okruzenje u running stanju.
    //Kernel snima ove registre prilikom prebacivanja sa user na kernel mod (sa 3 na 0)
    //tako da okruzenje moze kasnije nastavini gdje je stalo sa radom
  
  struct Env *env_link;		    // Next free Env
	
    //Ovo je pokazivac na narednu Env strukturu u env_free_list.env_free_list 
    //pokazuje naprvi slobodno okruzenje u lisit
  
  envid_t env_id;			        // Unique environment identifier
	
    //Kernel ovdje snima vrijednost koja jedinstveno odredjuje okruzenje koje
    //trenutno koristi Env struktura (tj. koristimo odredjeni element u envs nizu).
    //Nakon sto se korisnicko okruzenje terminira, kernel realocira tu strukturu u 
    //drugo okruzenje, ali novo okruzenje ima razlicit env_id od starog iako
    //okruzenje koristi isti red u envs nizu.
    
  envid_t env_parent_id;		  // env_id of this env's parent
	
    //Ovdje kernel snima vrijednost od okruzenja koje je napravilo ovo okruzenje.
    //Na ovaj nacin okruzenja formiraju porodicno stablo, koje ce biti korisno za 
    //pravljenje vaznih odluka koja ce okruzenja imati dozvolu da rade nesto
  
  enum EnvType env_type;		  // Indicates special system environments
	
    //Ovo se koristi za specijalna okruzenja . Za vecinu ce biti  ENV_TYPE_USER.
  
  unsigned env_status;	      // Status of the environment

    //Ova varijabla ima sljedece vrijednosti
    //
    //ENV_FREE:
    //    Indicira da je Env sturkura neaktivna i da se nalazi u env_free_list.
    //
    //ENV_RUNNABLE:
    //    Indicira da Env struktura predstavlja okruzenje koje ceka da se izvrsi
    //
    //ENV_RUNNING:
    //    Indicira da Env struktura predstavlja trenutno okruzenje koje se izvrsava
    //
    //ENV_NOT_RUNNABLE:
    //    Indicira da Env struktura predstavlja trenutno aktivno okruzenje, ali
    //    nije spremno da se izvrsi, npr. cekanje paketa sa mreze
    //
    //ENV_DYING:
    //    Indicira da se strutkura nalazi u zombie okruzenju, koje ceka da se oslobodi.
	uint32_t env_runs;		      // Number of times environment has run

	// Address space
	pde_t *env_pgdir;		        // Kernel virtual address of page dir

    //Ova varijabla cuva kernel virtualnu adresu od page directoy okruzenja.
  */
};

#endif // !JOS_INC_ENV_H
