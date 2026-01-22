# Segmented.

You have successfully implemented the **Bastion Host** pattern (or DMZ pattern).
- `public-proxy`: Has access to both worlds.
- `secure-db`: Only accessible by `private` members.
- `attacker`: Cannot touch `secure-db`.
